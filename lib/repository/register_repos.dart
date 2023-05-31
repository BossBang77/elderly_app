import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/repository/service/logout_client.dart';
import 'package:health_application/repository/service/register_client.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:retrofit/dio.dart';

import '../ui/base/model/failure.dart';
import '../ui/base/model/status_code.dart';
import '../ui/base/network_provider.dart';

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
