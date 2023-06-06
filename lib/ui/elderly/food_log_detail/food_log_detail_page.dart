import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_repository.dart';
import 'package:health_application/ui/elderly/food_log_detail/bloc/food_log_detail_bloc.dart';
import 'package:health_application/ui/elderly/food_log_detail/food_log_detail_view.dart';
import 'package:health_application/ui/elderly/food_log_detail/model/food_log_detail_model.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_search_item.dart';
import 'package:health_application/ui/elderly/food_search/repository/food_detail_repository.dart';

class FoodLogDetailPage extends StatelessWidget {
  const FoodLogDetailPage({
    required this.food, 
    required this.mealType,
    this.onSubmitted
  });

  final MealRecordItem food;
  final MealType mealType;
  final Function(MealRecordItem)? onSubmitted;

  @override 
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodLogDetailBloc(food, mealType, FoodDetailRepository(), MealRecordRepository.instance),
      child: FoodLogDetailView(onSubmitted: onSubmitted)
    );
  }
}