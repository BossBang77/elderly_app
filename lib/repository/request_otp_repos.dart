import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/repository/service/request_otp_client.dart';
import 'package:health_application/ui/base/app_config/conflig.dart';
import 'package:retrofit/dio.dart';
import '../ui/base/model/failure.dart';
import '../ui/base/model/status_code.dart';
import '../ui/base/network_provider.dart';
import '../ui/user_profile/model/response/request_otp_response.dart';

class RequestOtpRepository {
  RequestOtpRepository();

  final NetworkProvider networkProvider = ConfigEnv.networkProvider;
  late final RequestOtpService _requestOtpService =
      RequestOtpService(networkProvider.dioClient());

  Future<Either<Failure, RequestOtpResponse>> requestOtp(
      String mobileNumber) async {
    try {
      var body = {'mobileNumber': mobileNumber};
      final HttpResponse req = await _requestOtpService.requestOtp(body);
      final Map<String, dynamic> data = req.data;
      return Right(RequestOtpResponse.fromJson(data));
    } on DioError catch (error) {
      if (error.response?.statusCode == StatusCode.notFound) {
        return const Left(Failure(''));
      } else if (error.response?.statusCode == StatusCode.failure) {
        return const Left(Failure(''));
      } else {
        return const Left(Failure(''));
      }
    }
  }

  Future<Either<Failure, String>> verifyOtp(
      String mobileNumber, String token, String code) async {
    try {
      var body = {'mobileNumber': mobileNumber, 'token': token, 'code': code};
      final HttpResponse req = await _requestOtpService.requestOtp(body);
      final Map<String, dynamic> data = req.data;
      return Right('success');
    } on DioError catch (error) {
      if (error.response?.statusCode == StatusCode.notFound) {
        return const Left(Failure(''));
      } else if (error.response?.statusCode == StatusCode.failure) {
        return const Left(Failure(''));
      } else {
        return const Left(Failure(''));
      }
    }
  }
}
