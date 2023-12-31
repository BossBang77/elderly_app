import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/button_orange.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/elderly/food_log/bloc/food_log_bloc.dart';
import 'package:health_application/ui/elderly/food_log/bloc/food_log_state.dart';
import 'package:health_application/ui/elderly/food_log/food_log_view.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_repository.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class FoodLogPage extends StatelessWidget {
  const FoodLogPage({required this.mealType});
  final MealType mealType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodLogBloc(mealType, MealRecordRepository.instance),
      child: FoodLogView()
    );
  }
}