import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/repository/service/login_client.dart';
import 'package:health_application/ui/elderly/change_password/model/request_change_password.dart';

import 'package:retrofit/dio.dart';

import '../ui/base/model/failure.dart';
import '../ui/base/model/status_code.dart';
import '../ui/base/network_provider.dart';
import '../ui/register_profile/model/register_model.dart';
import '../ui/signIn_page/model/login_model.dart';
import '../ui/signIn_page/model/sign_in_model.dart';

class LoginRepository {
  LoginRepository();

  final NetworkProvider networkProvider = NetworkProvider();
  late final LoginService _loginService =
      LoginService(networkProvider.dioClient());

  Future<Either<Failure, LoginModel>> login(SignInModel body) async {
    try {
      final HttpResponse req = await _loginService.login(body.toJson());
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(LoginModel.fromJson(data['data']));
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

  Future<Either<Failure, LoginModel>> refreshToken(String token) async {
    Map<String, dynamic> body = {"refreshToken": token};
    try {
      final HttpResponse req = await _loginService.refreshToken(body);
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(LoginModel.fromJson(data['data']));
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

  Future<Either<Failure, RegisterModel>> getPfofile() async {
    try {
      final HttpResponse req = await _loginService.getProfile();
      final Map<String, dynamic> data = req.data;

      if (req.response.statusCode == StatusCode.success) {
        return Right(RegisterModel.fromJson(data['data']));
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

  Future<Either<Failure, String>> updatePfofile(RegisterModel body) async {
    try {
      final HttpResponse req = await _loginService.updateProfile(body.toJson());
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

  Future<Either<Failure, String>> uploadImageProfile(File file) async {
    try {
      String fileName = file.path.split('/').last;

      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });
      final HttpResponse req = await _loginService.uploadImageProfile(formData);
      final Map<String, dynamic> data = req.data;
      return Right('success');
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

  Future<Either<Failure, String>> changePassword(
      RequestChangePassword body) async {
    try {
      final HttpResponse req =
          await _loginService.changePassword(body.toJson());
      final Map<String, dynamic> data = req.data;
      return Right('success');
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
