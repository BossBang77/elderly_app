import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'food_detail_service.g.dart';

@RestApi(baseUrl: '')
abstract class FoodDetailService {
  factory FoodDetailService(Dio dio) = _FoodDetailService;

  @GET('/api/v1/food/information/{foodCode}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getFoodDetailByCode(@Path() String foodCode);
}