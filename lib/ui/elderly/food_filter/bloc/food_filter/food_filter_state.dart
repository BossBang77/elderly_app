import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';

class FoodFilterState extends Equatable {
  const FoodFilterState({
    required this.isCongentialDeceaseSelected,
    required this.isFoodAllergiesSelected,
    required this.foodTypes,
    required this.selectedTypes,
    required this.minimumCalories,
    required this.maximumCalories
  });

  const FoodFilterState.initial({
    this.isCongentialDeceaseSelected = false,
    this.isFoodAllergiesSelected = false,
    this.foodTypes = const [],
    this.selectedTypes = const[],
    this.minimumCalories = '',
    this.maximumCalories = ''
  });

  final bool isFoodAllergiesSelected;
  final bool isCongentialDeceaseSelected;
  final List<String> foodTypes;
  final List<String> selectedTypes;
  final String minimumCalories;
  final String maximumCalories;

  @override
  List<Object> get props => [
    isFoodAllergiesSelected,
    isCongentialDeceaseSelected,
    foodTypes,
    selectedTypes,
    minimumCalories,
    maximumCalories
  ];

  @override
  bool? get stringify => true;

  FoodFilterState copyWith({
    bool? isCongentialDeceaseSelected,
    bool? isFoodAllergiesSelected,
    List<String>? foodTypes,
    List<String>? selectedTypes,
    String? minimumCalories,
    String? maximumCalories
  }) {
    return FoodFilterState(
      isCongentialDeceaseSelected: isCongentialDeceaseSelected ?? this.isCongentialDeceaseSelected,
      isFoodAllergiesSelected: isFoodAllergiesSelected ?? this.isFoodAllergiesSelected,
      foodTypes: foodTypes ?? this.foodTypes,
      selectedTypes: selectedTypes ?? this.selectedTypes,
      minimumCalories: minimumCalories ?? this.minimumCalories,
      maximumCalories: maximumCalories ?? this.maximumCalories
    );
  }

  Map<String, dynamic> getMappedFilter() {
    Map<String, dynamic> mappedFilter = {};
    if (isCongentialDeceaseSelected) {
      mappedFilter['isCongentialDeceaseSelected'] = isCongentialDeceaseSelected;
    }
    if (isFoodAllergiesSelected) {
      mappedFilter['isFoodAllergiesSelected'] = isFoodAllergiesSelected;
    }
    if (selectedTypes.isNotEmpty) {
      mappedFilter['foodTypes'] = selectedTypes;
    }
    if (minimumCalories.isNotEmpty) {
      mappedFilter['minimumCalories'] = minimumCalories;
    }
    if (maximumCalories.isNotEmpty) {
      mappedFilter['maximumCalories'] = maximumCalories;
    }

    return mappedFilter;
  }
}


