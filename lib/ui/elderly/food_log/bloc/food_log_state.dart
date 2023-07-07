import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';

class FoodLogState extends Equatable {
  const FoodLogState(
      {this.foods = const [],
      required this.mealType,
      this.isSavedCompleted = IsSaveState.initial});

  final List<MealRecordItem> foods;
  final MealType mealType;
  final IsSaveState isSavedCompleted;

  @override
  List<Object?> get props => [foods, mealType, isSavedCompleted];

  FoodLogState copyWith(
      {List<MealRecordItem>? foods,
      MealType? mealType,
      IsSaveState? isSavedCompleted}) {
    return FoodLogState(
        foods: foods ?? this.foods,
        mealType: mealType ?? this.mealType,
        isSavedCompleted: isSavedCompleted ?? this.isSavedCompleted);
  }
}

enum IsSaveState { initial, success, fail }
