import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/ui/register_profile/model/sub_menu_model.dart';

class FoodFilterState extends Equatable {
  const FoodFilterState({
    required this.isCongentialDeceaseSelected,
    required this.isFoodAllergiesSelected,
    required this.foodTypes,
    required this.selectedTypes,
    required this.minimumCalories,
    required this.maximumCalories,
    this.selectedDisease = const[],
    this.selectedFoodAllergy = const[]
  });

  const FoodFilterState.initial({
    this.isCongentialDeceaseSelected = false,
    this.isFoodAllergiesSelected = false,
    this.foodTypes = const [],
    this.selectedTypes = const[],
    this.minimumCalories = '',
    this.maximumCalories = '',
    this.selectedDisease = const[],
    this.selectedFoodAllergy = const[]
  });

  final bool isFoodAllergiesSelected;
  final bool isCongentialDeceaseSelected;
  final List<String> foodTypes;
  final List<String> selectedTypes;
  final String minimumCalories;
  final String maximumCalories;
  final List<SubMenuModel> selectedDisease;
  final List<SubMenuModel> selectedFoodAllergy;

  @override
  List<Object> get props => [
    isFoodAllergiesSelected,
    isCongentialDeceaseSelected,
    foodTypes,
    selectedTypes,
    minimumCalories,
    maximumCalories,
    selectedDisease,
    selectedFoodAllergy
  ];

  @override
  bool? get stringify => true;

  FoodFilterState copyWith({
    bool? isCongentialDeceaseSelected,
    bool? isFoodAllergiesSelected,
    List<String>? foodTypes,
    List<String>? selectedTypes,
    String? minimumCalories,
    String? maximumCalories,
    List<SubMenuModel>? selectedDisease,
    List<SubMenuModel>? selectedFoodAllergy
  }) {
    return FoodFilterState(
      isCongentialDeceaseSelected: isCongentialDeceaseSelected ?? this.isCongentialDeceaseSelected,
      isFoodAllergiesSelected: isFoodAllergiesSelected ?? this.isFoodAllergiesSelected,
      foodTypes: foodTypes ?? this.foodTypes,
      selectedTypes: selectedTypes ?? this.selectedTypes,
      minimumCalories: minimumCalories ?? this.minimumCalories,
      maximumCalories: maximumCalories ?? this.maximumCalories,
      selectedDisease: selectedDisease ?? this.selectedDisease,
      selectedFoodAllergy: selectedFoodAllergy ?? this.selectedFoodAllergy
    );
  }

  Map<String, dynamic> getMappedFilter() {
    Map<String, dynamic> mappedFilter = {};
    if (isCongentialDeceaseSelected) {
      mappedFilter['isCongentialDeceaseSelected'] = isCongentialDeceaseSelected;
      mappedFilter['selectedDisease'] = selectedDisease.map((disease) => disease.name).toList();
    }
    if (isFoodAllergiesSelected) {
      mappedFilter['isFoodAllergiesSelected'] = isFoodAllergiesSelected;
      mappedFilter['selectedFoodAllergy'] = selectedFoodAllergy.map((food) => food.name).toList();
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


