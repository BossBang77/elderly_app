

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'food_search_service.g.dart';

@RestApi(baseUrl: '')
abstract class FoodSearchService {
  factory FoodSearchService(Dio dio) = _FoodSearchService;

  @POST('/api/v1/food/search')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> searchFood(@Body() Map<String, dynamic> body);
}