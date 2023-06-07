import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/bloc/food_page/food_page_event.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_repository.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/food_filter_bloc.dart';
import 'package:health_application/ui/elderly/food/bloc/food_page/food_page_bloc.dart';
import 'package:health_application/ui/elderly/food_log/bloc/food_log_bloc.dart';
import 'package:health_application/ui/elderly/food_search/bloc/food_search/food_search_bloc.dart';
import 'package:health_application/ui/elderly/food/food_view.dart';
import 'package:health_application/ui/elderly/food_search/repository/food_search_history_provider.dart';
import 'package:health_application/ui/elderly/food_search/repository/food_search_repository.dart';

class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => FoodSearchBloc(FoodSearchRepository(), FoodSearchHistoryProvider.instance),
        ),
        BlocProvider(
          create: (BuildContext context) => FoodPageBloc(MealRecordRepository.instance)..add(FoodPageMealRecordFetched())),
        // BlocProvider(
        //   create:(BuildContext context) => FoodLogBloc())
      ], 
      child: FoodView()
    );
  }
}