import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/base/model/status_code.dart';
import 'package:health_application/ui/base/network_provider.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/elderly/food_log/model/request/meal_record_request.dart';
import 'package:health_application/ui/elderly/food_log/model/request/meal_record_request_item.dart';
import 'package:health_application/ui/elderly/food_log/model/response/meal_record_response.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_stream.dart';
import 'package:health_application/ui/elderly/food_log/service/meal_record_service.dart';
import 'package:retrofit/dio.dart';

abstract class MealRecordRepositoryProtocol {
  MealRecordRepositoryProtocol();

  //property
  MealRecordStreamProtocol mealRecordStreamFor(MealType mealType);

  //function
  Future<Either<Failure, MealRecordResponse>> getMealRecord();
  Future<Either<Failure, HttpResponse>> saveMealRecord(SaveMealRecordRequest request);
  List<MealRecordItem> getCurrentMealListFrom(MealType mealType);
  void setMealListWith(MealType mealType, List<MealRecordItem> meals);
  void addMeal(MealRecordItem meal, MealType toMealType);
  void removeMeal(MealType mealType, int atIndex);
  SaveMealRecordRequest createRequestFromMealStream();
}

class MealRecordRepository implements MealRecordRepositoryProtocol {
  final NetworkProvider networkProvider = NetworkProvider();
  late final MealRecordService _mealRecordService = MealRecordService(networkProvider.dioClient());
  
  final StreamController streamController = StreamController();
  MealRecordStreamProtocol breakfast = MealRecordStream();
  MealRecordStreamProtocol lunch = MealRecordStream();
  MealRecordStreamProtocol snack = MealRecordStream();
  MealRecordStreamProtocol dinner = MealRecordStream();

  MealRecordRepository._();
  static final instance = MealRecordRepository._();

  @override
  Future<Either<Failure, MealRecordResponse>> getMealRecord() async {
    try {
      final HttpResponse request = await _mealRecordService.getMealRecord();
      final Map<String, dynamic> data = request.data;
      if (request.response.statusCode == StatusCode.success) {
        final response = MealRecordResponse.fromJson(data);
        updateStreamWithResponse(response);
        return Right(MealRecordResponse.fromJson(data));
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    }

    return Left(Failure(''));
  }

  void updateStreamWithResponse(MealRecordResponse response) {
    breakfast.updateItemList(response.data.breakfast.map((meal) => MealRecordItem.fromResponse(meal)).toList());
    lunch.updateItemList(response.data.lunch.map((meal) => MealRecordItem.fromResponse(meal)).toList());
    snack.updateItemList(response.data.snack.map((meal) => MealRecordItem.fromResponse(meal)).toList());
    dinner.updateItemList(response.data.dinner.map((meal) => MealRecordItem.fromResponse(meal)).toList());
    MealType.values.forEach((mealType) {
      final stream = mealRecordStreamFor(mealType);
      stream.createSnapshot(stream.value);
    });
  }

  List<MealRecordItem> getCurrentMealListFrom(MealType mealType) {
    return mealRecordStreamFor(mealType).value;
  }
  
  void setMealListWith(MealType mealType, List<MealRecordItem> meals) {
    mealRecordStreamFor(mealType).updateItemList(meals);
  }

  void addMeal(MealRecordItem meal, MealType toMealType) {
    List<MealRecordItem> mealRecordList = List.from(mealRecordStreamFor(toMealType).value);
    mealRecordList.add(meal);
    mealRecordStreamFor(toMealType).updateItemList(mealRecordList);
  }

  MealRecordStreamProtocol mealRecordStreamFor(MealType mealType) {
    switch (mealType) {
      case MealType.breakfast: return breakfast;
      case MealType.lunch: return lunch;
      case MealType.dinner: return dinner;
      case MealType.snack: return snack;
    }
  }
  
  @override
  Future<Either<Failure, HttpResponse>> saveMealRecord(SaveMealRecordRequest request) async {
    try {
      final response = await _mealRecordService.saveMealRecord(request.toJson());
      if (response.response.statusCode == StatusCode.success) {
        return Right(response);
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    }

    return Left(Failure(''));
  }

  @override 
  SaveMealRecordRequest createRequestFromMealStream() {
    return SaveMealRecordRequest(
      breakfast: breakfast.value.map((meal) => MealRecordRequestItem.fromMealRecordItem(meal)).toList(),
      lunch: lunch.value.map((meal) => MealRecordRequestItem.fromMealRecordItem(meal)).toList(),
      snack: snack.value.map((meal) => MealRecordRequestItem.fromMealRecordItem(meal)).toList(),
      dinner: dinner.value.map((meal) => MealRecordRequestItem.fromMealRecordItem(meal)).toList(),
    );
  }

  @override 
  void removeMeal(MealType mealType, int atIndex) {
    List<MealRecordItem> mealRecordList = List.from(mealRecordStreamFor(mealType).value);
    mealRecordList.removeAt(atIndex);
    mealRecordStreamFor(mealType).updateItemList(mealRecordList);
  }
}