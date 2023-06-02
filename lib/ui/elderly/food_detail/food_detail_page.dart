import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food_detail/bloc/food_detail_bloc.dart';
import 'package:health_application/ui/elderly/food_detail/food_detail_view.dart';
import 'package:health_application/ui/elderly/food_log/food_log_view.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({required this.food});
  
  final Food food;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodDetailBloc(food),
      child: FoodDetailView()
    );
  }
}