import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food_log_detail/bloc/food_log_detail_event.dart';
import 'package:health_application/ui/elderly/food_log_detail/bloc/food_log_detail_state.dart';

class FoodLogDetailBloc extends Bloc<FoodLogDetailEvent, FoodLogDetailState> {
  FoodLogDetailBloc(
    Food food,
  ): 
    food = food,
    super(FoodLogDetailState(consumeUnit: 1, food: food)) {
    on<FoodLogDetailConsumeUnitAdded>(_onConsumeUnitAdded);
    on<FoodLogDetailConsumeUnitSubstracted>(_onConsumeUnitSubstracted);
    on<FoodLogDetailSubmitted>(_onFoodLogDetailSubmitted);
  }

  final Food food;

  void _onConsumeUnitAdded( 
    FoodLogDetailConsumeUnitAdded event,
    Emitter<FoodLogDetailState> emit
  ) {
    emit(state.copyWith(consumeUnit: state.consumeUnit + 1));
  }

  void _onConsumeUnitSubstracted( 
    FoodLogDetailConsumeUnitSubstracted event,
    Emitter<FoodLogDetailState> emit
  ) {
    if (state.consumeUnit > 0) { return; }
    emit(state.copyWith(consumeUnit: state.consumeUnit - 1));
  }

  void _onFoodLogDetailSubmitted(
    FoodLogDetailSubmitted event,
    Emitter<FoodLogDetailState> emit
  ) {
    state.food.consumedUnit = state.consumeUnit;
    Food newFood = state.food.copyWith(consumedUnit: state.consumeUnit);
    emit(state.copyWith(food: newFood));
  }
} 