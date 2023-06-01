import 'package:equatable/equatable.dart';
import 'package:health_application/ui/food/model/food/food.dart';

class FoodSearchState extends Equatable {
  const FoodSearchState({
    this.searchValue = '',
    this.searchResults = const[],
    this.recentSearchValues = const[],
    this.searchFilter = const {}
  });

  final String searchValue;

  final List<Food> searchResults;

  final List<String> recentSearchValues;

  final Map<String, dynamic> searchFilter;

  @override
  List<Object?> get props => [searchValue, searchResults, recentSearchValues, searchFilter];

  FoodSearchState copyWith({
    String? searchValue,
    List<Food>? searchResults,
    List<String>? recentSearchValues,
    Map<String, dynamic>? searchFilter
  }) {
    return FoodSearchState(
      searchValue: searchValue ?? this.searchValue,
      searchResults: searchResults ?? this.searchResults,
      recentSearchValues: recentSearchValues ?? this.recentSearchValues,
      searchFilter: searchFilter ?? this.searchFilter
    );
  }
}