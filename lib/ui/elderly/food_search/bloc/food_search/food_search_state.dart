import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_search_item.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_search_response.dart';

class FoodSearchState extends Equatable {
  const FoodSearchState(
      {this.searchValue = '',
      this.searchResults = const [],
      this.recentSearchValues = const [],
      this.searchFilter = const {}});

  final String searchValue;

  final List<FoodSearchItem> searchResults;

  final List<String> recentSearchValues;

  final Map<String, dynamic> searchFilter;

  @override
  List<Object?> get props =>
      [searchValue, searchResults, recentSearchValues, searchFilter];

  FoodSearchState copyWith(
      {String? searchValue,
      List<FoodSearchItem>? searchResults,
      List<String>? recentSearchValues,
      Map<String, dynamic>? searchFilter}) {
    return FoodSearchState(
        searchValue: searchValue ?? this.searchValue,
        searchResults: searchResults ?? this.searchResults,
        recentSearchValues: recentSearchValues ?? this.recentSearchValues,
        searchFilter: searchFilter ?? this.searchFilter);
  }
}
