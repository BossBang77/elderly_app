import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';

abstract class FoodLogEvent extends Equatable {
  const FoodLogEvent();

  @override
  List<Object> get props => [];
}

class FoodLogFetched extends FoodLogEvent {}

class FoodLogAddMoreFoodButtonTapped extends FoodLogEvent {}

class FoodLogSaveButtonTapped extends FoodLogEvent {}

class FoodLogListUpdated extends FoodLogEvent {
  const FoodLogListUpdated({required this.mealType, required this.mealList});

  final List<MealRecordItem> mealList;
  final MealType mealType;

  @override
  List<Object> get props => [mealType, mealList];
}

class FoodLogBackButtonTapped extends FoodLogEvent {}

class FoodLogFoodSelected extends FoodLogEvent {
  const FoodLogFoodSelected({required this.food});

  final Food food;

  @override
  List<Object> get props => [food];
}