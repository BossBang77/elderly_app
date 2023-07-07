import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/elderly/food_search/bloc/food_search/food_search_event.dart';
import 'package:health_application/ui/elderly/food_search/bloc/food_search/food_search_state.dart';
import 'package:health_application/ui/elderly/food_search/model/request/food_search_request.dart';
import 'package:health_application/ui/elderly/food_search/model/request/food_search_sort.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_search_item.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_search_response.dart';
import 'package:health_application/ui/elderly/food_search/repository/food_search_history_provider.dart';
import 'package:health_application/ui/elderly/food_search/repository/food_search_repository.dart';

class FoodSearchBloc extends Bloc<FoodSearchEvent, FoodSearchState> {
  FoodSearchBloc(
    FoodSearchRepositoryProtocol foodSearchRepository,
    SearchHistoryProvider<String> historyProvider,
  )   : _searchHistoryProvider = historyProvider,
        _foodSearchRepository = foodSearchRepository,
        super(const FoodSearchState()
            .copyWith(recentSearchValues: historyProvider.history)) {
    on<FoodSearchTextFieldValueChanged>(_onSearchTextFieldValueChanged);
    on<FoodSearchFilterButtonTapped>(_onFilterButtonTapped);
    on<FoodSearchFilterApplied>(_onFilterApplied);
    on<FoodSearchRecentSearchSelected>(_onRecentSearchSelected);
    on<FoodSearchResultSelected>(_onSearchResultSelected);
    on<FoodSearchSubmitted>(_onFoodSearchSubmitted);
  }

  FoodSearchRepositoryProtocol _foodSearchRepository;
  SearchHistoryProvider<String> _searchHistoryProvider;
  Set<FoodSearchItem> _cachedSearchResultItem = Set();

  void _onSearchTextFieldValueChanged(
      FoodSearchTextFieldValueChanged event, Emitter<FoodSearchState> emit) {
    var currentSearchResult = _cachedSearchResultItem.toList();
    currentSearchResult.sort((a, b) => a.name.compareTo(b.name));
    var filteredResult = currentSearchResult
        .where((element) => element.name.contains(event.value))
        .toList();
    emit(state.copyWith(
        searchValue: event.value, searchResults: filteredResult));
  }

  void _onFilterButtonTapped(
      FoodSearchFilterButtonTapped event, Emitter<FoodSearchState> emit) {}

  void _onFilterApplied(
      FoodSearchFilterApplied event, Emitter<FoodSearchState> emit) {
    emit(state.copyWith(searchFilter: event.filter));
  }

  void _onRecentSearchSelected(
      FoodSearchRecentSearchSelected event, Emitter<FoodSearchState> emit) {
    _searchHistoryProvider.pushEntry(event.value);
    List<String> recenSearchValues = _searchHistoryProvider.history;
    emit(state.copyWith(
        recentSearchValues: recenSearchValues, searchValue: event.value));
  }

  void _onSearchResultSelected(
      FoodSearchResultSelected event, Emitter<FoodSearchState> emit) {}

  void _onFoodSearchSubmitted(
      FoodSearchSubmitted event, Emitter<FoodSearchState> emit) async {
    if (!event.value.isEmpty) {
      _searchHistoryProvider.pushEntry(event.value);
    }
    List<String> recenSearchValues = _searchHistoryProvider.history;
    print('search filter');
    print(state.searchFilter);
    final request = FoodSearchRequest(
        keyword: event.value,
        limit: 20,
        offset: 0,
        calorieMin: state.searchFilter['minimumCalories'] ?? 0,
        calorieMax: state.searchFilter['maximumCalories'] ?? 9999,
        allergicFoods: state.searchFilter['selectedFoodAllergy'] ?? [],
        types: state.searchFilter['foodTypes'] ?? [],
        sort: FoodSearchSort(by: "string", order: "ASC"));
    print(request.toJson());

    final response = await _foodSearchRepository.searchFoodWith(request);

    response.fold((error) {
      //TODO handle error
      emit(state.copyWith(recentSearchValues: recenSearchValues));
    }, (response) {
      _cachedSearchResultItem.addAll(response.data);
      emit(state.copyWith(
          searchResults: response.data, recentSearchValues: recenSearchValues));
      return;
    });
  }
}
