import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/repository/service/logout_client.dart';
import 'package:health_application/ui/base/model/status_code.dart';
import 'package:retrofit/dio.dart';

import '../ui/base/model/failure.dart';
import '../ui/base/network_provider.dart';

class LogoutRepository {
  LogoutRepository();

  final NetworkProvider networkProvider = NetworkProvider();
  late final LogoutService _logoutService =
      LogoutService(networkProvider.dioClient());

  Future<Either<Failure,int>> sendLogout() async {
    try {
      final HttpResponse req =
          await _logoutService.sendLogout();
      if (req.response.statusCode == StatusCode.success) {
        return Right(req.response.statusCode ?? StatusCode.success);
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
