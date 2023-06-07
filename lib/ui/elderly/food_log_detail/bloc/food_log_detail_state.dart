import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/calories.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';
import 'package:health_application/ui/elderly/food_log_detail/model/food_log_detail_model.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_search_item.dart';

class FoodLogDetailState extends Equatable {
  const FoodLogDetailState({
    required this.consumeUnit,
    required this.food,
    this.foodDetail = const FoodDetail()
  });

  final int consumeUnit;
  final MealRecordItem food;
  final FoodDetail foodDetail;

  double get calories => consumeUnit * food.calorie;

  @override
  List<Object?> get props => [consumeUnit, food, calories];

  FoodLogDetailState copyWith({
    int? consumeUnit,
    MealRecordItem? food,
    FoodDetail? foodDetail
  }) {
    return FoodLogDetailState(
      consumeUnit: consumeUnit ?? this.consumeUnit, 
      food: food ?? this.food,
      foodDetail: foodDetail ?? this.foodDetail
    );
  }
}