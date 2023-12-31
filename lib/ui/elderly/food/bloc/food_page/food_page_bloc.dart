import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/bloc/food_page/food_page_event.dart';
import 'package:health_application/ui/elderly/food/bloc/food_page/food_page_state.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/calories.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/carbohydrate.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/cholesterol.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/fat.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/protein.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/sugar.dart';
import 'package:health_application/ui/elderly/food_log/model/response/meal_record_response.dart';
import 'package:health_application/ui/elderly/food_log/model/response/summary_calorie.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_repository.dart';

class FoodPageBloc extends Bloc<FoodPageEvent, FoodPageState> {
  FoodPageBloc(MealRecordRepositoryProtocol mealRecordRepository)
      : _mealRecordRepository = mealRecordRepository,
        super(FoodPageState()) {
    on<FoodPageMealRecordFetched>(_onMealRecordFetched);
  }

  MealRecordRepositoryProtocol _mealRecordRepository;

  void _onMealRecordFetched(
      FoodPageMealRecordFetched event, Emitter<FoodPageState> emit) async {
    final response = await _mealRecordRepository.getMealRecord();
    response.fold((error) {
      emit(state.copyWith(meals: [], nutrients: []));
    }, (response) {
      List<Meal> newList = _mapListMealFromResponse(response);
      List<Nutrient> nutritionFact = _mapNutritionFactSummary(response);

      emit(state.copyWith(
          meals: newList,
          nutrients: nutritionFact,
          summaryCalorie: response.data.summaryCalorie));
    });
  }

  List<Meal> _mapListMealFromResponse(MealRecordResponse response) {
    return [
      Meal(
          mealType: MealType.breakfast,
          foods: response.data.breakfast
              .map((meal) => MealRecordItem.fromResponse(meal))
              .toList()),
      Meal(
          mealType: MealType.lunch,
          foods: response.data.lunch
              .map((meal) => MealRecordItem.fromResponse(meal))
              .toList()),
      Meal(
          mealType: MealType.snack,
          foods: response.data.snack
              .map((meal) => MealRecordItem.fromResponse(meal))
              .toList()),
      Meal(
          mealType: MealType.dinner,
          foods: response.data.dinner
              .map((meal) => MealRecordItem.fromResponse(meal))
              .toList())
    ];
  }

  List<Nutrient> _mapNutritionFactSummary(MealRecordResponse response) {
    return [
      Calories(value: response.data.nutritionFactSummary.calorie),
      Fat(value: response.data.nutritionFactSummary.fat),
      Protein(value: response.data.nutritionFactSummary.protein),
      Carbohydrate(value: response.data.nutritionFactSummary.carbohydrate),
      Sugar(value: response.data.nutritionFactSummary.sugar),
      Cholesterol(value: response.data.nutritionFactSummary.cholesterol)
    ];
  }
}

String getSummaryCalorie(SummaryCalorie summaryCalorie, String type) {
  if (type == MealType.breakfast.name) {
    return summaryCalorie.breakfast.toString();
  } else if (type == MealType.lunch.name) {
    return summaryCalorie.lunch.toString();
  } else if (type == MealType.snack.name) {
    return summaryCalorie.snack.toString();
  } else {
    return summaryCalorie.dinner.toString();
  }
}
