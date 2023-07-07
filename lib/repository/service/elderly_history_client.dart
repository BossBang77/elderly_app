import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'elderly_history_client.g.dart';

@RestApi(baseUrl: '')
abstract class ELderlyHistoryService {
  factory ELderlyHistoryService(Dio dio) = _ELderlyHistoryService;

  @GET(
      '/api/v1/food/history/statistics?startDate={startDate}&endDate={endDate}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getSummaryFood(
      @Path('startDate') String startDate, @Path('endDate') String endDate);

  @GET('/api/v1/food/history/recording-information?date={selectDate}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getHistoryLogFood(@Path('selectDate') String selectDate);

  @GET(
      '/api/v1/exercise/history/statistics?startDate={startDate}&endDate={endDate}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getSummaryExercise(
      @Path('startDate') String startDate, @Path('endDate') String endDate);

  @GET('/api/v1/exercise/history/recording-information?date={selectDate}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getHistoryLogExercise(
      @Path('selectDate') String selectDate);

  @GET(
      '/api/v1/drinking-water/history/statistics?startDate={startDate}&endDate={endDate}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getSummaryDrinkingWater(
      @Path('startDate') String startDate, @Path('endDate') String endDate);

  @GET('/api/v1/drinking-water/history/recording-information?date={selectDate}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getHistoryLogDrinkingWater(
      @Path('selectDate') String selectDate);
}
