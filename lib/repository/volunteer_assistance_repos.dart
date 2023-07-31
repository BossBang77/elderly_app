import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/repository/service/volunteer_assistant.dart';
import 'package:health_application/ui/base/app_config/conflig.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/volunteer/request_assistance_detail/model/assitance_model.dart';
import 'package:health_application/ui/volunteer/request_assistance_detail/model/request_assitance_list.dart';
import 'package:health_application/ui/volunteer/request_assistance_detail/model/submit_assistance.dart';
import 'package:retrofit/dio.dart';
import '../ui/base/model/failure.dart';
import '../ui/base/model/status_code.dart';
import '../ui/base/network_provider.dart';

class VolunteerAssistanceRepository {
  VolunteerAssistanceRepository();

  final NetworkProvider networkProvider = ConfigEnv.networkProvider;
  late final VolunteerAssistantService _assistantService =
      VolunteerAssistantService(networkProvider.dioClient());

  Future<Either<Failure, RequestAssitanceListModel>> getEmergencyList() async {
    try {
      final HttpResponse req = await _assistantService.getEmergencyList();

      final Map<String, dynamic> data = req.data;
      return Right(RequestAssitanceListModel.fromJson(data));
    } on DioError catch (error) {
      if (error.response?.statusCode == StatusCode.notFound) {
        return const Left(Failure(''));
      } else if (error.response?.statusCode == StatusCode.failure) {
        return const Left(Failure(''));
      }
    }
    return const Left(Failure(''));
  }

  Future<Either<Failure, AssitanceDetailModel>> getEmergencyDetail(
      String id) async {
    try {
      final HttpResponse req = await _assistantService.getEmergencyById(id);
      final Map<String, dynamic> data = req.data;
      return Right(AssitanceDetailModel.fromJson(data['data']));
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

  Future<Either<Failure, String>> submitAssistanct(
      SubmitAssistance body) async {
    try {
      final HttpResponse req =
          await _assistantService.agreeEmergency(body.toJson());
      final Map<String, dynamic> data = req.data;
      return Right('success');
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
