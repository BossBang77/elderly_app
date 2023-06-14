import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/base/model/status_code.dart';
import 'package:health_application/ui/base/network_provider.dart';
import 'package:health_application/ui/elderly/appointment/repository/response_handler.dart';
import 'package:health_application/ui/elderly/food_search/model/request/food_search_request.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_search_response.dart';
import 'package:health_application/ui/elderly/food_search/service/food_search_service.dart';
import 'package:retrofit/dio.dart';

abstract class FoodSearchRepositoryProtocol {
  Future<Either<Failure, FoodSearchResponse>> searchFoodWith(FoodSearchRequest request);
}

class FoodSearchRepository implements FoodSearchRepositoryProtocol {
  final NetworkProvider networkProvider = NetworkProvider();
  late FoodSearchService _foodSearchService = FoodSearchService(networkProvider.dioClient());
  ResponseHandler jsonResponseHandler = JsonResponseHandler();

  @override
  Future<Either<Failure, FoodSearchResponse>> searchFoodWith(FoodSearchRequest request) async {
    try {
      final HttpResponse response = await _foodSearchService.searchFood(request.toJson());
      if (response.response.statusCode == StatusCode.success) {
        final foodSearchResponse = FoodSearchResponse.fromJson(response.data);
        return Right(foodSearchResponse);
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    }
    return Left(Failure(''));
  }
}