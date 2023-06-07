import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';

class FoodLogState extends Equatable {
  const FoodLogState({this.foods = const[], required this.mealType});

  final List<MealRecordItem> foods;
  final MealType mealType;
  
  @override
  List<Object?> get props => [foods];

  FoodLogState copyWith({
    List<MealRecordItem>? foods,
    MealType? mealType
  }) {
    return FoodLogState(
      foods: foods ?? this.foods,
      mealType: mealType ?? this.mealType
    );
  }
}