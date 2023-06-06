import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/food_filter_bloc.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/state_restorable.dart';
import 'package:health_application/ui/elderly/food_search/bloc/food_search/food_search_bloc.dart';
import 'package:health_application/ui/elderly/food_search/food_search_view.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_search_item.dart';
import 'package:health_application/ui/elderly/food_search/repository/food_search_history_provider.dart';
import 'package:health_application/ui/elderly/food_search/repository/food_search_repository.dart';

class FoodSearchPage extends StatelessWidget {
  const FoodSearchPage({this.onFoodSelected, this.onItemTrailingIconTap});

  final Function(FoodSearchItem)? onFoodSelected;
  final Function(FoodSearchItem)? onItemTrailingIconTap;
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => FoodSearchBloc(FoodSearchRepository(), FoodSearchHistoryProvider.instance),
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