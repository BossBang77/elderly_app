import 'package:equatable/equatable.dart';
import 'package:health_application/ui/food/model/food/food.dart';

abstract class FoodSearchEvent extends Equatable {
  const FoodSearchEvent();

  @override
  List<Object> get props => [];

  @override 
  bool? get stringify => true;
}

class FoodSearchTextFieldValueChanged extends FoodSearchEvent {
  const FoodSearchTextFieldValueChanged({required this.value});

  final String value;

  @override
  List<Object> get props => [value];
}

class FoodSearchFilterButtonTapped extends FoodSearchEvent {
  const FoodSearchFilterButtonTapped();
}

class FoodSearchRecentSearchSelected extends FoodSearchEvent {
  const FoodSearchRecentSearchSelected({required this.value});

  final String value;

  @override
  List<Object> get props => [value];
}

class FoodSearchResultSelected extends FoodSearchEvent {
  const FoodSearchResultSelected({required this.food});

  final Food food;

  @override
  List<Object> get props => [food];
}

class FoodSearchFilterApplied extends FoodSearchEvent {

  const FoodSearchFilterApplied({required this.filter});

  final Map<String, dynamic> filter;

  @override
  List<Object> get props => [filter];
}

class FoodSearchSubmitted extends FoodSearchEvent {
  const FoodSearchSubmitted({required this.value});

  final String value;

  @override
  List<Object> get props => [value];
}