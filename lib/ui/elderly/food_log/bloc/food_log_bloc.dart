import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/calories.dart';
import 'package:health_application/ui/elderly/food_log/bloc/food_log_event.dart';
import 'package:health_application/ui/elderly/food_log/bloc/food_log_state.dart';
import 'package:health_application/ui/elderly/food_log/model/request/meal_record_request.dart';
import 'package:health_application/ui/elderly/food_log/model/request/meal_record_request_item.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_repository.dart';

class FoodLogBloc extends Bloc<FoodLogEvent, FoodLogState> {
  FoodLogBloc(
    MealType mealType,
    MealRecordRepositoryProtocol mealRecordRepository
  ): 
  _mealRecordRepository = mealRecordRepository,
  _mealType = mealType,
  super(FoodLogState(foods: mealRecordRepository.getCurrentMealListFrom(mealType), mealType: mealType)){
    on<FoodLogAddMoreFoodButtonTapped>(_onAddButtonTapped);
    on<FoodLogSaveButtonTapped>(_onSaveButtonTapped);
    on<FoodLogFoodSelected>(_onFoodSelected);
    on<FoodLogListUpdated>(_onFoodLogListUpdated);
    on<FoodLogBackButtonTapped>(_onBackButtonTapped);
    on<FoodLogMealItemRemoved>(_onFoodLogMealItemRemoved);

    MealType.values.forEach((element) {
      mealRecordRepository.mealRecordStreamFor(element).listen((event) => {
        add(FoodLogListUpdated(mealType: MealType.breakfast, mealList: event))
      });
    }); 
  }

  MealRecordRepositoryProtocol _mealRecordRepository;
  MealType _mealType;

  void _onAddButtonTapped(
    FoodLogAddMoreFoodButtonTapped event,
    Emitter<FoodLogState> emit
  ) {
  }

  void _onSaveButtonTapped(
    FoodLogSaveButtonTapped event,
    Emitter<FoodLogState> emit
  ) async {
    final breakfast = _mealRecordRepository
      .getCurrentMealListFrom(MealType.breakfast)
      .map((meal) => MealRecordRequestItem.fromMealRecordItem(meal)).toList();
    final lunch = _mealRecordRepository
      .getCurrentMealListFrom(MealType.lunch)
      .map((meal) => MealRecordRequestItem.fromMealRecordItem(meal)).toList();
    final snack = _mealRecordRepository
      .getCurrentMealListFrom(MealType.snack)
      .map((meal) => MealRecordRequestItem.fromMealRecordItem(meal)).toList();
    final dinner = _mealRecordRepository
      .getCurrentMealListFrom(MealType.dinner)
      .map((meal) => MealRecordRequestItem.fromMealRecordItem(meal)).toList();
    final request = SaveMealRecordRequest(
      breakfast: breakfast,
      lunch: lunch,
      snack: snack,
      dinner: dinner
    );
    final response = await _mealRecordRepository.saveMealRecord(request);
    response.fold(
      (error) {
        //TODO handle error
      }, 
      (response) {
        //TODO handle save complete'
         MealType.values.forEach((mealType) {
          final snapshot = _mealRecordRepository.mealRecordStreamFor(mealType).value;
          _mealRecordRepository.mealRecordStreamFor(mealType).createSnapshot(snapshot);
        }); 
        emit(state.copyWith(isSavedCompleted: true));
      }
    );
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
    // List<MealRecordItem> newItemList = List.from(state.foods);
    // newItemList.add(event.newItem);
    print("FoodLogListUpdated");
    emit(state.copyWith(foods: event.mealList));
  }

  void _onBackButtonTapped(
    FoodLogBackButtonTapped event,
    Emitter<FoodLogState> emit
  ) {
    _mealRecordRepository.mealRecordStreamFor(_mealType).restoreState();
  }

  void _onFoodLogMealItemRemoved(
    FoodLogMealItemRemoved event,
    Emitter<FoodLogState> emit
  ) {
    _mealRecordRepository.removeMeal(_mealType, event.index);
  }
}