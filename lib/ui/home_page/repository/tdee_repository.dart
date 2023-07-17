import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/ui/base/app_config/conflig.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/base/model/status_code.dart';
import 'package:health_application/ui/base/network_provider.dart';
import 'package:health_application/ui/home_page/model/tdee_response.dart';
import 'package:health_application/ui/home_page/service/get_tdee_service.dart';
import 'package:retrofit/dio.dart';

abstract class TDEERepositoryProtocol {
  Future<Either<Failure, TDEEResponse>> getTdee();
}

class TDEERepository implements TDEERepositoryProtocol {
  final NetworkProvider networkProvider = ConfigEnv.networkProvider;
  late final GetTDEEService _getTDEEService =
      GetTDEEService(networkProvider.dioClient());

  @override
  Future<Either<Failure, TDEEResponse>> getTdee() async {
    try {
      final response = await _getTDEEService.getTDEE();
      if (response.response.statusCode == StatusCode.success) {
        return Right(TDEEResponse.fromJson(response.data));
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    }
    return Left(Failure(''));
  }
}
