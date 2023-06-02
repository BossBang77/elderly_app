import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';

abstract class FoodLogEvent extends Equatable {
  const FoodLogEvent();

  @override
  List<Object> get props => [];
}

class FoodLogAddMoreFoodButtonTapped extends FoodLogEvent {}

class FoodLogSaveButtonTapped extends FoodLogEvent {}

class FoodLogListUpdated extends FoodLogEvent {
  const FoodLogListUpdated({required this.newItem});
  final Food newItem;

  @override
  List<Object> get props => [newItem];
}

class FoodLogFoodSelected extends FoodLogEvent {
  const FoodLogFoodSelected({required this.food});

  final Food food;

  @override
  List<Object> get props => [food];
}