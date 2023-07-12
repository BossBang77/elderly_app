import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/repository/service/water_intake_client.dart';
import 'package:health_application/ui/base/app_config/conflig.dart';
import 'package:health_application/ui/elderly/water_intake/model/daily_drinking.dart';
import 'package:health_application/ui/elderly/water_intake/model/daily_drinking_list.dart';
import 'package:health_application/ui/elderly/water_intake/model/water_intake_goal.dart';
import 'package:retrofit/dio.dart';
import '../ui/base/model/failure.dart';
import '../ui/base/model/status_code.dart';
import '../ui/base/network_provider.dart';

class WaterIntakeRepository {
  WaterIntakeRepository();

  final NetworkProvider networkProvider = ConfigEnv.networkProvider;
  late final WaterIntakeService _waterIntakeService =
      WaterIntakeService(networkProvider.dioClient());

  Future<Either<Failure, WaterIntakeGoalModel>> getWaterdrinkingGoal() async {
    try {
      final HttpResponse req = await _waterIntakeService.getDrinkingWaterGoal();
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(WaterIntakeGoalModel.fromJson(data['data']));
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

  Future<Either<Failure, String>> updateWaterdrinkingGoal(int newGoal) async {
    try {
      var data = {"target": newGoal};
      final HttpResponse req =
          await _waterIntakeService.updateDrinkingGoal(jsonEncode(data));
      final Map<String, dynamic> resData = req.data;
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

  Future<Either<Failure, DailyWaterListModel>> getDailyWaterList() async {
    try {
      final HttpResponse req =
          await _waterIntakeService.getDrinkingWaterDaily();
      final Map<String, dynamic> resData = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(DailyWaterListModel.fromJson(resData));
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

  Future<Either<Failure, String>> addDailyWater(DailyWaterModel body) async {
    try {
      final HttpResponse req =
          await _waterIntakeService.createDrinkingDaily(body.toJson());
      final Map<String, dynamic> resData = req.data;

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

  Future<Either<Failure, String>> updateDailyWater(DailyWaterModel body) async {
    try {
      final HttpResponse req =
          await _waterIntakeService.updateDrinkingDaily(body.toJson());
      return Right('success');
    } on DioError catch (error) {
      print(body.toJson());
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

  Future<Either<Failure, String>> removeDailyWater(String id) async {
    try {
      final HttpResponse req =
          await _waterIntakeService.deleteDrinkingWaterDaily(id);
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
