import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/repository/service/emergency_client.dart';
import 'package:health_application/repository/service/login_client.dart';
import 'package:health_application/ui/base/app_config/conflig.dart';
import 'package:health_application/ui/elderly/request_assistance/model/reesponse/emergency_detail_model.dart';
import 'package:health_application/ui/elderly/request_assistance/model/request/create_emergency_model.dart';

import 'package:retrofit/dio.dart';

import '../ui/base/model/failure.dart';
import '../ui/base/model/status_code.dart';
import '../ui/base/network_provider.dart';
import '../ui/elderly/request_assistance/model/request/update_status_emergency_model.dart';

class EmergencyRepository {
  EmergencyRepository();

  final NetworkProvider networkProvider = ConfigEnv.networkProvider;
  late final EmergencyService _emergencyService =
      EmergencyService(networkProvider.dioClient());

  Future<Either<Failure, String>> createEmergency(
      CreateEmergencyModel body) async {
    try {
      final HttpResponse req =
          await _emergencyService.createEmergency(body.toJson());
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

  Future<Either<Failure, EmergencyHelpDetailModel>> getEmergencyDetail() async {
    try {
      final HttpResponse req = await _emergencyService.getEmergencyDetail();
      final Map<String, dynamic> data = req.data;
      print(data);
      return Right(EmergencyHelpDetailModel.fromJson(data['data']));
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

  Future<Either<Failure, String>> updateEmergencyStatus(
      UpdateStatusEmergencyModel body) async {
    try {
      final HttpResponse req =
          await _emergencyService.updateStatusEmergency(body.toJson());
      return Right('');
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
