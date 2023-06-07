import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/bloc/food_page/food_page_event.dart';
import 'package:health_application/ui/elderly/food/bloc/food_page/food_page_state.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/calories.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/elderly/food_log/model/response/meal_record_response.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_repository.dart';

class FoodPageBloc extends Bloc<FoodPageEvent, FoodPageState> {
  FoodPageBloc(
    MealRecordRepositoryProtocol mealRecordRepository
  ): _mealRecordRepository = mealRecordRepository,
  super(FoodPageState()) {
    on<FoodPageMealRecordFetched>(_onMealRecordFetched);
    on<FoodPageOnMealRecordUpdated>(_onMealRecordUpdated);

    MealType.values.forEach((mealType) {
      mealRecordRepository.mealRecordStreamFor(mealType).listen((event) => {
        add(FoodPageOnMealRecordUpdated(mealType: mealType, items: event))
      });
    }); 
  }

  MealRecordRepositoryProtocol _mealRecordRepository;

  void _onMealRecordUpdated(
    FoodPageOnMealRecordUpdated event,
    Emitter<FoodPageState> emit
  ) {
    // List<Meal> newList = _mapListMealFromResponse(item);
    

    List<Meal> meals = List.from(state.meals);
    
    int index = state.meals.indexWhere((meal) => meal.mealType == event.mealType);
    if (index >= 0) {
      Meal meal = meals[index];
      Meal newMeal = meal.copyWith(foods: event.items);
      meals[index] = newMeal;
      emit(state.copyWith(meals: List.from(meals)));
    }
  }

  void _onMealRecordFetched(
    FoodPageMealRecordFetched event,
    Emitter<FoodPageState> emit
  ) async {
    final response = await _mealRecordRepository.getMealRecord();
    response.fold(
      (error) {
        //TODO: handle error
        print("error");
      }, 
      (response) {
        List<Meal> newList = _mapListMealFromResponse(response);
        emit(state.copyWith(meals: newList));
      }
    );
  }

  List<Meal> _mapListMealFromResponse(MealRecordResponse response) {
    return [
      Meal(
        mealType: MealType.breakfast, 
        foods: response.data.breakfast.map((meal) => MealRecordItem.fromResponse(meal)).toList()
      ),
      Meal(
        mealType: MealType.lunch, 
        foods: response.data.lunch.map((meal) => MealRecordItem.fromResponse(meal)).toList()
      ),
      Meal(
        mealType: MealType.snack, 
        foods: response.data.snack.map((meal) => MealRecordItem.fromResponse(meal)).toList()
      ),
      Meal(
        mealType: MealType.dinner, 
        foods: response.data.dinner.map((meal) => MealRecordItem.fromResponse(meal)).toList()
      )
    ];
  }
}