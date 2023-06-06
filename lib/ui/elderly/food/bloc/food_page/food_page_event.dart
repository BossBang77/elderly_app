import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';

abstract class FoodPageEvent extends Equatable {
  const FoodPageEvent();

  @override
  List<Object?> get props => [];
}

class FoodPageMealRecordFetched extends FoodPageEvent {}

class FoodPageOnMealRecordUpdated extends FoodPageEvent {
  const FoodPageOnMealRecordUpdated({
    required this.mealType,
    required this.items
  });

  final MealType mealType;
  final List<MealRecordItem> items;
}