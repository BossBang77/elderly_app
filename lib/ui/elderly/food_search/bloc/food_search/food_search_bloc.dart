import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food_search/bloc/food_search/food_search_event.dart';
import 'package:health_application/ui/elderly/food_search/bloc/food_search/food_search_state.dart';

class FoodSearchBloc extends Bloc<FoodSearchEvent, FoodSearchState> {
  FoodSearchBloc() : super(const FoodSearchState()) {
    on<FoodSearchTextFieldValueChanged>(_onSearchTextFieldValueChanged);
    on<FoodSearchFilterButtonTapped>(_onFilterButtonTapped);
    on<FoodSearchFilterApplied>(_onFilterApplied);
    on<FoodSearchRecentSearchSelected>(_onRecentSearchSelected);
    on<FoodSearchResultSelected>(_onSearchResultSelected);
    on<FoodSearchSubmitted>(_onFoodSearchSubmitted);
  } 

  void _onSearchTextFieldValueChanged(
    FoodSearchTextFieldValueChanged event,
    Emitter<FoodSearchState> emit
  ) {
    emit(state.copyWith(searchValue: event.value));
  }

  void _onFilterButtonTapped(
    FoodSearchFilterButtonTapped event,
    Emitter<FoodSearchState> emit
  ) {

  }

  void _onFilterApplied(
    FoodSearchFilterApplied event,
    Emitter<FoodSearchState> emit
  ) {
    emit(state.copyWith(searchFilter: event.filter));
  }

  void _onRecentSearchSelected(
    FoodSearchRecentSearchSelected event,
    Emitter<FoodSearchState> emit
  ) {
    List<String> recentSearchValues = _handleRecentSearchValueAppend(state.recentSearchValues, event.value);

    emit(state.copyWith(
      recentSearchValues: recentSearchValues,
      searchValue: event.value
    ));
  }

  List<String> _handleRecentSearchValueAppend(List<String> recentSearchValues, String newValue) {
    List<String> recentValues = List.from(recentSearchValues);
    if (recentValues.contains(newValue)) {
      recentValues.remove(newValue);
    } 

    recentValues = [newValue, ...recentValues];
    return recentValues;
  }

  void _onSearchResultSelected(
    FoodSearchResultSelected event,
    Emitter<FoodSearchState> emit
  ) {

  }

  void _onFoodSearchSubmitted(
    FoodSearchSubmitted event,
    Emitter<FoodSearchState> emit
  ) {
    if (event.value.isEmpty) { return; }
    List<String> recentSearchs = _handleRecentSearchValueAppend(state.recentSearchValues, event.value);
    emit(state.copyWith(recentSearchValues: recentSearchs));
  } 
}