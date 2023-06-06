import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/repository/service/exercise_client.dart';
import 'package:health_application/ui/elderly/exercise/model/exerise_daily_model.dart';
import 'package:health_application/ui/elderly/exercise/model/search_exercise_model.dart';
import 'package:health_application/ui/elderly/exercise/model/search_res_list.dart';
import 'package:retrofit/dio.dart';
import '../ui/base/model/failure.dart';
import '../ui/base/model/status_code.dart';
import '../ui/base/network_provider.dart';
import '../ui/elderly/exercise/model/search_information.dart';

class ExerciseRepository {
  ExerciseRepository();

  final NetworkProvider networkProvider = NetworkProvider();
  late final ExerciseService _exerciseService =
      ExerciseService(networkProvider.dioClient());

  Future<Either<Failure, SearchResListModel>> searchExercise(
      SearchExerciseModel body) async {
    try {
      final HttpResponse req =
          await _exerciseService.searchExcerise(body.toJson());
      final Map<String, dynamic> data = req.data;

      if (req.response.statusCode == StatusCode.success) {
        return Right(SearchResListModel.fromJson(data));
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

  Future<Either<Failure, SearchInformationModel>> getExerciseInformation(
      String code) async {
    try {
      final HttpResponse req =
          await _exerciseService.getExerciseInformation(code);
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(SearchInformationModel.fromJson(data['data']));
      }
    } on DioError catch (error) {
      print(error);
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

  Future<Either<Failure, ExerciseDailyModel>> getExerciseDaily() async {
    try {
      final HttpResponse req = await _exerciseService.getDailyActivity();
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(ExerciseDailyModel.fromJson(data['data']));
      }
    } on DioError catch (error) {
      print(error);
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
