import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'meal_record_service.g.dart';

@RestApi(baseUrl: '')
abstract class MealRecordService {
  factory MealRecordService(Dio dio) = _MealRecordService;

  @GET('/api/v1/food/get-meal-record')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getMealRecord();

  @POST('/api/v1/food/save-meal-record')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> saveMealRecord(@Body() Map<String, dynamic> body);
}