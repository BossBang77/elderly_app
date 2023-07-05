import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/ui/base/model/status_code.dart';
import 'package:health_application/ui/base/network_provider.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_exercise/model/elderly_history_exercise_response.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_exercise/model/elderly_log_exercise_response.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/elderly_history_food_response.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/elderly_log_food_response.dart';
import 'package:retrofit/retrofit.dart';

import '../ui/base/model/failure.dart';
import 'service/elderly_history_client.dart';

class ElderlyHistoryRepository {
  ElderlyHistoryRepository();

  final NetworkProvider networkProvider = NetworkProvider();
  late final ELderlyHistoryService _elderlyHistoryService =
      ELderlyHistoryService(networkProvider.dioClient());

  Future<Either<Failure, ElderlyHistoryModelResponse>> getSummaryFood(
      String startDate, String endDate) async {
    try {
      final HttpResponse req =
          await _elderlyHistoryService.getSummaryFood(startDate, endDate);
      final Map<String, dynamic> data = req.data;

      if (req.response.statusCode == StatusCode.success) {
        return Right(ElderlyHistoryModelResponse.fromJson(data));
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

  Future<Either<Failure, ElderlyLogFoodResponse>> getHistoryLogFood(
      String selectedDate) async {
    try {
      final HttpResponse req =
          await _elderlyHistoryService.getHistoryLogFood(selectedDate);
      final Map<String, dynamic> data = req.data;

      if (req.response.statusCode == StatusCode.success) {
        return Right(ElderlyLogFoodResponse.fromJson(data));
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

  Future<Either<Failure, ElderlyHistoryExerciseResponse>> getSummaryExercise(
      String startDate, String endDate) async {
    try {
      final HttpResponse req =
          await _elderlyHistoryService.getSummaryExercise(startDate, endDate);
      final Map<String, dynamic> data = req.data;

      if (req.response.statusCode == StatusCode.success) {
        return Right(ElderlyHistoryExerciseResponse.fromJson(data));
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

  Future<Either<Failure, ElderlyLogExerciseResponse>> getHistoryLogExercise(
      String selectedDate) async {
    try {
      final HttpResponse req =
          await _elderlyHistoryService.getHistoryLogExercise(selectedDate);
      final Map<String, dynamic> data = req.data;

      if (req.response.statusCode == StatusCode.success) {
        return Right(ElderlyLogExerciseResponse.fromJson(data));
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
