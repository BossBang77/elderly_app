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
}
