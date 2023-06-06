import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_repository.dart';
import 'package:health_application/ui/elderly/food_log_detail/bloc/food_log_detail_event.dart';
import 'package:health_application/ui/elderly/food_log_detail/bloc/food_log_detail_state.dart';
import 'package:health_application/ui/elderly/food_log_detail/model/food_log_detail_model.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_search_item.dart';
import 'package:health_application/ui/elderly/food_search/repository/food_detail_repository.dart';
import 'package:retrofit/dio.dart';

class FoodLogDetailBloc extends Bloc<FoodLogDetailEvent, FoodLogDetailState> {
  FoodLogDetailBloc(
    MealRecordItem food,
    MealType mealType,
    FoodDetailRepositoryProtocol foodDetailRepository,
    MealRecordRepositoryProtocol mealRecordRepository
  ): 
    food = food,
    mealType = mealType,
    _foodDetailRepository = foodDetailRepository,
    _mealRecordRepository = mealRecordRepository,
    super(FoodLogDetailState(consumeUnit: 1, food: food)) {
    on<FoodLogDetailConsumeUnitAdded>(_onConsumeUnitAdded);
    on<FoodLogDetailConsumeUnitSubstracted>(_onConsumeUnitSubstracted);
    on<FoodLogDetailSubmitted>(_onFoodLogDetailSubmitted);
    on<FoodLogDetailPageInitialized>(_onFoodLogDetailInitial);

    add(FoodLogDetailPageInitialized());
  }

  FoodDetailRepositoryProtocol _foodDetailRepository;
  MealRecordRepositoryProtocol _mealRecordRepository;

  final MealRecordItem food;
  final MealType mealType;

  void _onFoodLogDetailInitial(
    FoodLogDetailPageInitialized event,
    Emitter<FoodLogDetailState> emit
  ) async {
    final response = await _foodDetailRepository.getFoodDetaiByCodel(food.code);
    response.fold(
      (error) {
        //TODO handle error
      }, 
      (response) {
        emit(state.copyWith(foodDetail: response.data));
      }
    );
  }

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
    MealRecordItem meal = MealRecordItem(
      calorie: state.food.calorie,
      name: state.food.name,
      code: state.food.code,
      unit: state.consumeUnit
    );
    _mealRecordRepository.addMeal(meal, mealType);
    emit(state.copyWith(food: meal));
  }
} 