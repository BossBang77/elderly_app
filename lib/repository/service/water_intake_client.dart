import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'water_intake_client.g.dart';

@RestApi(baseUrl: '')
abstract class WaterIntakeService {
  factory WaterIntakeService(Dio dio) = _WaterIntakeService;

  @POST('/api/v1/drinking-water/daily')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> createDrinkingDaily(@Body() Map<String, dynamic> body);

  @GET('/api/v1/drinking-water/goal')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getDrinkingWaterGoal();

  @GET('/api/v1/drinking-water/daily')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getDrinkingWaterDaily();

  @DELETE('/api/v1/drinking-water/daily/{id}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> deleteDrinkingWaterDaily(@Path() String id);

  @PUT('/api/v1/drinking-water/goal')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> updateDrinkingGoal(@Body() String body);

  @PUT('/api/v1/drinking-water/daily')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> updateDrinkingDaily(@Body() Map<String, dynamic> body);
}
