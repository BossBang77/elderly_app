import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/calories.dart';
import 'package:health_application/ui/elderly/food_log/bloc/food_log_event.dart';
import 'package:health_application/ui/elderly/food_log/bloc/food_log_state.dart';

class FoodLogBloc extends Bloc<FoodLogEvent, FoodLogState> {
  FoodLogBloc(): super(FoodLogState(foods: [
    Food(
      name: 'name', 
      calories: Calories(value: 300),
      energy: Calories(value: 375.8)
    ),
    Food(
      name: 'name', 
      calories: Calories(value: 300),
      energy: Calories(value: 375.8)
    )
  ])){
    on<FoodLogAddMoreFoodButtonTapped>(_onAddButtonTapped);
    on<FoodLogSaveButtonTapped>(_onSaveButtonTapped);
    on<FoodLogFoodSelected>(_onFoodSelected);
    on<FoodLogListUpdated>(_onFoodLogListUpdated);
  }

  void _onAddButtonTapped(
    FoodLogAddMoreFoodButtonTapped event,
    Emitter<FoodLogState> emit
  ) {

  }

  void _onSaveButtonTapped(
    FoodLogSaveButtonTapped event,
    Emitter<FoodLogState> emit
  ) {

  }

  void _onFoodSelected(
    FoodLogFoodSelected event,
    Emitter<FoodLogState> emit
  ) {

  }

  void _onFoodLogListUpdated(
    FoodLogListUpdated event,
    Emitter<FoodLogState> emit
  ) {
    List<Food> newItemList = List.from(state.foods);
    newItemList.add(event.newItem);
    emit(state.copyWith(foods: newItemList));
  }
}