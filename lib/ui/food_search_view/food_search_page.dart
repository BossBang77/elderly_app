import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/food/bloc/food_filter/food_filter_bloc.dart';
import 'package:health_application/ui/food/bloc/food_filter/state_restorable.dart';
import 'package:health_application/ui/food/bloc/food_search/food_search_bloc.dart';
import 'package:health_application/ui/food_search_view/food_search_view.dart';

class FoodSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => FoodSearchBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => FoodFilterBloc(FoodFilterStateRestorer()),
        ),
      ], 
      child: FoodSearchView()
    );
  }
}