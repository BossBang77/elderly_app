import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/ui/base/app_config/conflig.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/base/model/status_code.dart';
import 'package:health_application/ui/base/network_provider.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail_response.dart';
import 'package:health_application/ui/elderly/food_search/service/food_detail_service.dart';
import 'package:retrofit/dio.dart';

abstract class FoodDetailRepositoryProtocol {
  Future<Either<Failure, FoodDetailResponse>> getFoodDetaiByCodel(String code);
}

class FoodDetailRepository implements FoodDetailRepositoryProtocol {
  final NetworkProvider networkProvider = ConfigEnv.networkProvider;
  late FoodDetailService _foodDetailService =
      FoodDetailService(networkProvider.dioClient());

  @override
  Future<Either<Failure, FoodDetailResponse>> getFoodDetaiByCodel(
      String code) async {
    try {
      final HttpResponse response =
          await _foodDetailService.getFoodDetailByCode(code);
      if (response.response.statusCode == StatusCode.success) {
        final foodSearchResponse = FoodDetailResponse.fromJson(response.data);
        return Right(foodSearchResponse);
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    }
    return Left(Failure(''));
  }
}
