import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food_detail/bloc/food_detail_bloc.dart';
import 'package:health_application/ui/elderly/food_detail/bloc/food_detail_event.dart';
import 'package:health_application/ui/elderly/food_detail/food_detail_view.dart';
import 'package:health_application/ui/elderly/food_log/food_log_view.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail.dart';
import 'package:health_application/ui/elderly/food_search/repository/food_detail_repository.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({required this.foodCode});

  final String foodCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FoodDetailBloc(foodCode, FoodDetailRepository())
          ..add(LoadFoodDetail(foodCode: foodCode)),
        child: FoodDetailView());
  }
}
