import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';

class FoodLogState extends Equatable {
  const FoodLogState({required this.foods});

  final List<Food> foods;
  
  @override
  List<Object?> get props => [foods];

  FoodLogState copyWith({
    List<Food>? foods
  }) {
    return FoodLogState(
      foods: foods ?? this.foods
    );
  }
}