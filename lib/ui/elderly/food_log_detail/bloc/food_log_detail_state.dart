import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';

class FoodLogDetailState extends Equatable {
  const FoodLogDetailState({
    required this.consumeUnit,
    required this.food
  });

  final int consumeUnit;
  final Food food;

  double get calories => consumeUnit * food.calories.value;

  @override
  List<Object?> get props => [consumeUnit, food, calories];

  FoodLogDetailState copyWith({
    int? consumeUnit,
    Food? food
  }) {
    return FoodLogDetailState(
      consumeUnit: consumeUnit ?? this.consumeUnit, 
      food: food ?? this.food
    );
  }
}