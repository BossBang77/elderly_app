import 'package:equatable/equatable.dart';

abstract class FoodFilterEvent extends Equatable {
  const FoodFilterEvent();

  @override
  List<Object> get props => [];

  @override 
  bool? get stringify => true;
}

class FoodFilterSnapshotCreated extends FoodFilterEvent {}

class FoodFilterStateRestored extends FoodFilterEvent {}

class FoodFilterCongentialDeceaseToggled extends FoodFilterEvent {
  const FoodFilterCongentialDeceaseToggled({required this.isCongentialDeceaseSelected});

  final bool isCongentialDeceaseSelected;

  @override
  List<Object> get props => [isCongentialDeceaseSelected];
}

class FoodFilterFoodAllergiesToggled extends FoodFilterEvent {
  const FoodFilterFoodAllergiesToggled({required this.isFoodAllergiesSelected});

  final bool isFoodAllergiesSelected;

  @override
  List<Object> get props => [isFoodAllergiesSelected];
}

class FoodFilterFoodTypeSelected extends FoodFilterEvent {
  const FoodFilterFoodTypeSelected({required this.foodTypes});

  final String foodTypes;

  @override
  List<Object> get props => [foodTypes];
}

class FoodFilterMinimumCaloriesTextFieldValueChanged extends FoodFilterEvent {
  const FoodFilterMinimumCaloriesTextFieldValueChanged({required this.minimumCalories});

  final String minimumCalories;

  @override
  List<Object> get props => [minimumCalories];
}

class FoodFilterMaximumCaloriesTextFieldValueChanged extends FoodFilterEvent {
  const FoodFilterMaximumCaloriesTextFieldValueChanged({required this.maximumCalories});

  final String maximumCalories;

  @override
  List<Object> get props => [maximumCalories];
}

class FoodFilterClearButtonTapped extends FoodFilterEvent {
  const FoodFilterClearButtonTapped();
}

class FoodFilterSearchButtonTapped extends FoodFilterEvent {
  const FoodFilterSearchButtonTapped();
}