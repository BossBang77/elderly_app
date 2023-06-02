import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/food_filter_bloc.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/state_restorable.dart';
import 'package:health_application/ui/elderly/food_search/bloc/food_search/food_search_bloc.dart';
import 'package:health_application/ui/elderly/food_search/food_search_view.dart';

class FoodSearchPage extends StatelessWidget {
  const FoodSearchPage({this.onFoodSelected, this.onItemTrailingIconTap});

  final Function(Food)? onFoodSelected;
  final Function(Food)? onItemTrailingIconTap;
  
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
      child: FoodSearchView(
        onFoodSelected: onFoodSelected,
        onItemTrailingIconTap: onItemTrailingIconTap,
      )
    );
  }
}