import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';

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

class ApiInterceptors extends Interceptor {
  final Dio dio;

  ApiInterceptors(this.dio);

  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path.contains('/authentication/oauth/token')) {
      return handler.next(options);
    } else {
      var accessToken = await UserSecureStorage().getAccessToken();

      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      } else {
        options.headers['Authorization'] =
            "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiI0Mzc5OSIsImhvbWVfYnJhbmNoX2NvZGUiOiIzMTMiLCJhZF9udW1iZXIiOiI0Mzc5OSIsImN1cnJlbnRfYnJhbmNoX2NvZGUiOiIzMTMiLCJob21lX3Bvc2l0aW9uX2NvZGUiOiIwMDI3MzciLCJjdXJyZW50X2JyYW5jaF9uYW1lX3RoIjoi4Liq4Liy4LiC4Liy4Liq4Li44Lij4Liy4Lip4LiO4Lij4LmM4LiY4Liy4LiZ4Li1IiwiaWNfbGljZW5zZV90eXBlX25hbWUiOiIiLCJjbGllbnRfaWQiOiJpbnYtYXV0aCIsInRlbGxlcl9pZCI6IjczODEwMjhEIiwic2NvcGUiOlsicmVhZCIsIndyaXRlIl0sImN1cnJlbnRfcG9zaXRpb25fY29kZSI6IjAwMjczNyIsImV4cCI6MTY2Njk1MzkyMCwiZmlyc3RfbmFtZSI6IlN1cGF0dHJhIiwiY3VycmVudF9icmFuY2hfbmFtZV9lbiI6IlN1cmF0IFRoYW5pIEJyYW5jaCIsImp0aSI6IjE3ZjU0MmRjLTJiOGYtNDc1NC1iYTIyLWZiMzhhYzBjMzYyYiIsImhvbWVfYnJhbmNoX25hbWVfZW4iOiJTdXJhdCBUaGFuaSBCcmFuY2giLCJpY19saWNlbnNlX2lkIjoiIiwiaG9tZV9wb3NpdGlvbl9uYW1lX2VuIjoiQXNzaXN0YW50IEJyYW5jaCBCYW5raW5nIEFkdmlzb3IiLCJsYXN0X25hbWUiOiJCb29uc3Jpcm9qZSIsImhvbWVfYnJhbmNoX25hbWVfdGgiOiLguKrguLLguILguLLguKrguLjguKPguLLguKnguI7guKPguYzguJjguLLguJnguLUiLCJjdXJyZW50X3Bvc2l0aW9uX25hbWVfdGgiOiLguJzguLnguYnguIrguYjguKfguKLguYDguIjguYnguLLguKvguJnguYnguLLguJfguLXguYjguKrguYjguIfguYDguKrguKPguLTguKHguJjguLjguKPguIHguLTguIjguKrguLLguILguLIiLCJhdXRob3JpdGllcyI6WyJVU0VSIl0sImhvbWVfcG9zaXRpb25fbmFtZV90aCI6IuC4nOC4ueC5ieC4iuC5iOC4p-C4ouC5gOC4iOC5ieC4suC4q-C4meC5ieC4suC4l-C4teC5iOC4quC5iOC4h-C5gOC4quC4o-C4tOC4oeC4mOC4uOC4o-C4geC4tOC4iOC4quC4suC4guC4siIsImN1cnJlbnRfcG9zaXRpb25fbmFtZV9lbiI6IkFzc2lzdGFudCBCcmFuY2ggQmFua2luZyBBZHZpc29yIiwiaWNfbGljZW5zZV90eXBlIjoiIiwidGlja2V0SWQiOiI0ODY5ODMxYS1kNGZmLTRhNzYtOThjNS05NTNjZDMxYTY3NmUiLCJ1c2VybmFtZSI6IjQzNzk5IiwiaWNfbGljZW5zZV9leHBpcnlfZGF0ZSI6IiJ9.IyDzKfbHgiUSFCzWg_lI2MqBX_23dO0rdUgBiUA4IGDpep1G5bFPuG2GBc6twp_Be7fgrzR0Qnpcz-Sx2VkcPW3QQLpoIO7yyxCBW_YgGCQrrg6loO4XpKnVshX2RfNpYoNBthHqLtj8jA5NzVM5dX6HwfOBZbdNnLn_DPD4tFXI392sEwNnPhExGNDCoyt0X96BdFYV30AQ35KAoPz9dZt8Zg8qD4_CydFgwcwlX0lW9vW_BnkWDq_IH_L6ht_apib7gi2Gn1IKb_TM1Bp1oUXwsUlblj9_FbdBsXiYHUm7LCV4SyzbfunWUCXHRGfcX4-fJuVIVDa60aRlQ8j1QQ";
      }

      return handler.next(options);
    }
  }

  @override
  Future<dynamic> onError(
      DioError error, ErrorInterceptorHandler handler) async {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(error.requestOptions);
      case DioErrorType.response:
        if (error.response?.statusCode == 403 ||
            error.response?.statusCode == 401) {}
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(error.requestOptions);
    }
    return handler.next(error);
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
