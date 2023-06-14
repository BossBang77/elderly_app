import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/base/model/status_code.dart';
import 'package:health_application/ui/elderly/appointment/model/decodable.dart';
import 'package:retrofit/retrofit.dart';

abstract class ResponseHandler {
  Future<Either<Failure, ModelType>> handleResponseFrom<ModelType extends Decodable<ModelType>>({
    required Future<HttpResponse<dynamic>> request, 
    required ModelType Function(Map<String, dynamic>) decodeWith
  });
  Future<Either<Failure, HttpResponse>> handleGenericResponseFrom(Future<HttpResponse<dynamic>> request);
}

class JsonResponseHandler implements ResponseHandler {
  @override
  Future<Either<Failure, ModelType>> handleResponseFrom<ModelType extends Decodable<ModelType>>({
    required Future<HttpResponse> request, 
    required ModelType Function(Map<String, dynamic>) decodeWith
  }) async {
    try {
      final response = await request;
      final Map<String, dynamic> data = response.data;
      print(response.response.statusCode == StatusCode.success);
      if (response.response.statusCode == StatusCode.success) {
        return Right(decodeWith(data));
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    }

    return Left(Failure(''));
  }
  
  @override
  Future<Either<Failure, HttpResponse>> handleGenericResponseFrom(Future<HttpResponse> request) async {
    try {
      final response = await request;
      print(response.response.statusCode == StatusCode.success);
      if (response.response.statusCode == StatusCode.success) {
        return Right(response);
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    }

    return Left(Failure(''));
  }
}