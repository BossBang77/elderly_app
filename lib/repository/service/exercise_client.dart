import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'exercise_client.g.dart';

@RestApi(baseUrl: '')
abstract class ExerciseService {
  factory ExerciseService(Dio dio) = _ExerciseService;

  @POST('/api/v1/exercise/search')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> searchExcerise(@Body() Map<String, dynamic> body);

  @GET('/api/v1/exercise/information/{exerciseCode}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getExerciseInformation(@Path() String exerciseCode);

  @GET('/api/v1/exercise/daily-exercise-log/total-stats')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getDailyActivity();

  @GET('/api/v1/exercise/daily-exercise-log')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getExerciseRecord();

  @DELETE('/api/v1/exercise/daily-exercise-log/{id}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> removeExerciseRecord(@Path() String id);

  @POST('/api/v1/exercise/daily-exercise-log')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> saveExerciseDaily(@Body() Map<String, dynamic> body);
}
