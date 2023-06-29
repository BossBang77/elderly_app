import 'dart:io';

import 'package:alice/alice.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_application/repository/login_repos.dart';
import 'package:health_application/ui/base/cubit/expired_cubit.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/signIn_page/model/login_model.dart';

import 'app_config/app_config.dart';
import 'app_config/conflig.dart';

///provide dio client
class NetworkProvider {
  ///constructor
  NetworkProvider();

  ///alice
  final Alice alice = Alice(showNotification: false);



  ///setting
  AppConfig setting = ConfigEnv.appConfig;
  // Dio
  Dio? _dio;
  Dio dioClient() {
    var dio = Dio(BaseOptions(
        baseUrl: setting.envPath,
        receiveTimeout: 60000,
        connectTimeout: 60000,
        sendTimeout: 60000,
        contentType: 'application/json'));

    dio.interceptors.addAll({
      alice.getDioInterceptor(),
      // TODO: set interceptor after can call service
      ApiInterceptors(dio),
    });

    return dio;
  }
}

class ApiInterceptors extends QueuedInterceptor {
  final Dio dio;

  ApiInterceptors(this.dio);

  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!PlublicRequest().isPlublicRequest(options.path)) {
      var accessToken = await UserSecureStorage().getAccessToken();

      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      } else {
        options.headers['Authorization'] = 'Bearer';
      }

      return handler.next(options);
    }

    return handler.next(options);
  }

  @override
  Future<dynamic> onError(
      DioError error, ErrorInterceptorHandler handler) async {
    switch (error.type) {
      //TODO
      // case DioErrorType.connectTimeout:
      // case DioErrorType.sendTimeout:
      // case DioErrorType.receiveTimeout:
      // throw DeadlineExceededException(error.requestOptions);
      case DioErrorType.response:
        if (error.response?.statusCode == 401) {
          var res = await refreshToken();
          if (res != null && res) {
            await _retry(error.requestOptions);
          } else {
            TokenExpiredCubit().isExpired(true);
          }
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(error.requestOptions);
    }
    return handler.next(error);
  }

  /// Api to get new token from refresh token
  ///
  Future<bool?> refreshToken() async {
    var refreshToken = await UserSecureStorage().getRefreshToken();

    if (refreshToken != null) {
      var response = await LoginRepository().refreshToken(refreshToken);
      response.fold((error) {
        return null;
      }, (LoginModel res) async {
        await UserSecureStorage().setAccessToken(res.accessToken);
        await UserSecureStorage().setRefreshToken(res.refreshToken);
        await UserSecureStorage().setUserData(res);
        return true;
      });
    }
    return null;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class PlublicRequest {
  static String get registerUrl => '/api/v1/user/register';
  static String get loginUrl => '/api/v1/authentication';
  static String get masterData => '/api/v1/common/master/';

  bool isPlublicRequest(String url) {
    return url.contains(loginUrl) ||
        url.contains(registerUrl) ||
        url.contains(masterData);
  }
}
