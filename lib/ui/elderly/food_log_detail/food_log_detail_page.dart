import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food_log_detail/bloc/food_log_detail_bloc.dart';
import 'package:health_application/ui/elderly/food_log_detail/food_log_detail_view.dart';

class FoodLogDetailPage extends StatelessWidget {
  const FoodLogDetailPage({
    required this.food, 
    this.onSubmitted
  });

  final Food food;
  final Function(Food)? onSubmitted;

  @override 
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodLogDetailBloc(food),
      child: FoodLogDetailView(onSubmitted: onSubmitted)
    );
  }
}