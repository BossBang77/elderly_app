import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/repository/service/logout_client.dart';
import 'package:health_application/repository/service/register_client.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/signIn_page/forgot_password/model/request_submit_new_password.dart';
import 'package:health_application/ui/signIn_page/forgot_password/model/verify_response.dart';
import 'package:retrofit/dio.dart';

import '../ui/base/model/failure.dart';
import '../ui/base/model/status_code.dart';
import '../ui/base/network_provider.dart';
import '../ui/signIn_page/forgot_password/bloc/forgot_password_bloc.dart';
import '../ui/signIn_page/forgot_password/model/request_reset_password.dart';
import '../ui/signIn_page/forgot_password/model/verify_reset_password.dart';
import '../ui/user_profile/model/response/request_otp_response.dart';

class RegisterRepository {
  RegisterRepository();

  final NetworkProvider networkProvider = NetworkProvider();
  late final RegisterService _registerService =
      RegisterService(networkProvider.dioClient());

  Future<Either<Failure, int>> registerProfile(RegisterModel body) async {
    try {
      final HttpResponse req =
          await _registerService.registerProfile(body.toJson());

      if (req.response.statusCode == StatusCode.success) {
        return Right(req.response.statusCode ?? 0);
      }
    } on DioError catch (error) {
      print(error.response);
      if (error.response?.statusCode == StatusCode.notFound) {
        print('Error 400 $error');
        return const Left(Failure(''));
      } else if (error.response?.statusCode == StatusCode.failure) {
        print('Error 500 $error');
        return const Left(Failure(''));
      }
    }
    return const Left(Failure(''));
  }

  Future<Either<bool, bool>> checkExisting(String userName) async {
    try {
      var body = {'username': userName};
      final HttpResponse req = await _registerService.checkExisting(body);
      if (req.response.statusCode == StatusCode.success) {
        return Left(false);
      } else {
        return Left(false);
      }
    } on DioError catch (error) {
      if (error.response?.statusCode == StatusCode.fileNotFound) {
        print('${error.response?.statusCode} $error');
        return const Right(true);
      } else if (error.response?.statusCode == StatusCode.failure) {
        print('Error 500 $error');
        return Left(false);
      } else {
        return Left(false);
      }
    }
  }

  Future<Either<Failure, RequestOtpResponse>> requestResetPassword(
      String phone) async {
    try {
      var body = RequestResetPasswordModel(username: phone);
      final HttpResponse req =
          await _registerService.resetPasswordRequest(body.toJson());
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(RequestOtpResponse.fromJson(data['data']));
      }
    } on DioError catch (error) {
      print(error.response);
      if (error.response?.statusCode == StatusCode.notFound) {
        print('Error 400 $error');
        return const Left(Failure(''));
      } else if (error.response?.statusCode == StatusCode.failure) {
        print('Error 500 $error');
        return const Left(Failure(''));
      }
    }
    return const Left(Failure(''));
  }

  Future<Either<Failure, VerifyResponse>> verifyResetPassword(
      VertifyResetPassword body) async {
    try {
      final HttpResponse req =
          await _registerService.resetPasswordVerify(body.toJson());
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(VerifyResponse.fromJson(data['data']));
      }
    } on DioError catch (error) {
      print(error.response);
      if (error.response?.statusCode == StatusCode.notFound) {
        print('Error 400 $error');
        return const Left(Failure(''));
      } else if (error.response?.statusCode == StatusCode.failure) {
        print('Error 500 $error');
        return const Left(Failure(''));
      }
    }
    return const Left(Failure(''));
  }

  Future<Either<Failure, String>> submitResetPassword(
      RequestSubmitNewPasswordModel body) async {
    try {
      final HttpResponse req =
          await _registerService.resetPassword(body.toJson());
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right('success');
      }
    } on DioError catch (error) {
      print(error.response);
      if (error.response?.statusCode == StatusCode.notFound) {
        print('Error 400 $error');
        return const Left(Failure(''));
      } else if (error.response?.statusCode == StatusCode.failure) {
        print('Error 500 $error');
        return const Left(Failure(''));
      }
    }
    return const Left(Failure(''));
  }
}
