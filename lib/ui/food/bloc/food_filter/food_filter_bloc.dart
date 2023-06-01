import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/food/bloc/food_filter/food_filter_event.dart';
import 'package:health_application/ui/food/bloc/food_filter/food_filter_state.dart';
import 'package:health_application/ui/food/bloc/food_filter/state_restorable.dart';

class FoodFilterBloc extends Bloc<FoodFilterEvent, FoodFilterState> {
  FoodFilterBloc(
    StateRestorable<FoodFilterState> foodStateRestorer
  ) :  foodStateRestorer = foodStateRestorer, super(const FoodFilterState.initial()) {
    on<FoodFilterCongentialDeceaseToggled>(_onCongentialDeceaseToggled);
    on<FoodFilterFoodAllergiesToggled>(_onFoodAllergiesToggled);
    on<FoodFilterFoodTypeSelected>(_onFoodTypeSelected);
    on<FoodFilterMinimumCaloriesTextFieldValueChanged>(_onMinimumCaloriesTextFieldValueChanged);
    on<FoodFilterMaximumCaloriesTextFieldValueChanged>(_onMaximumCaloriesTextFieldValueChanged);
    on<FoodFilterClearButtonTapped>(_onFilterClearButtonTapped);
    on<FoodFilterSearchButtonTapped>(_onFilterSearchButtonTapped);
    on<FoodFilterSnapshotCreated>(_onFoodFilterSnapshotCreated);
    on<FoodFilterStateRestored>(_onFoodFilterStateRestored);
  }

  StateRestorable<FoodFilterState> foodStateRestorer;

  void _onFoodFilterStateRestored(
    FoodFilterStateRestored event,
    Emitter<FoodFilterState> emit
  ) {
    FoodFilterState snapshot = foodStateRestorer.restoreState();
    emit(state.copyWith(
      isCongentialDeceaseSelected: snapshot.isCongentialDeceaseSelected,
      isFoodAllergiesSelected: snapshot.isFoodAllergiesSelected,
      foodTypes: snapshot.foodTypes,
      selectedTypes: snapshot.selectedTypes,
      minimumCalories: snapshot.minimumCalories,
      maximumCalories: snapshot.maximumCalories
    ));
  }

  void _onFoodFilterSnapshotCreated(
    FoodFilterSnapshotCreated event,
    Emitter<FoodFilterState> emit
  ) {
    foodStateRestorer.createSnapshot(state);
  }

  void _onCongentialDeceaseToggled(
    FoodFilterCongentialDeceaseToggled event,
    Emitter<FoodFilterState> emit
  ) {
    emit(state.copyWith(isCongentialDeceaseSelected: event.isCongentialDeceaseSelected));
  }

  void _onFoodAllergiesToggled(
    FoodFilterFoodAllergiesToggled event,
    Emitter<FoodFilterState> emit
  ) {
    emit(state.copyWith(isFoodAllergiesSelected: event.isFoodAllergiesSelected));
  }

  void _onFoodTypeSelected(
    FoodFilterFoodTypeSelected event,
    Emitter<FoodFilterState> emit
  ) {
    List<String> newSelectedType = _handleFoodTypeSelected(state.selectedTypes, event.foodTypes);
    emit(state.copyWith(selectedTypes: newSelectedType));
  }

  List<String> _handleFoodTypeSelected(List<String> foodTypeList, String newValue) {
    List<String> newFoodTypeList = List.from(foodTypeList);
    if (newFoodTypeList.contains(newValue)) {
      newFoodTypeList.remove(newValue);
    } else {
      newFoodTypeList.add(newValue);
    }

    return newFoodTypeList;
  }

  void _onMinimumCaloriesTextFieldValueChanged(
    FoodFilterMinimumCaloriesTextFieldValueChanged event, 
    Emitter<FoodFilterState> emit
  ) {
    emit(state.copyWith(minimumCalories: event.minimumCalories));
  }

  void _onMaximumCaloriesTextFieldValueChanged(
    FoodFilterMaximumCaloriesTextFieldValueChanged event,
    Emitter<FoodFilterState> emit
  ) {
    emit(state.copyWith(maximumCalories: event.maximumCalories));
  }

  void _onFilterClearButtonTapped(
    FoodFilterClearButtonTapped event,
    Emitter<FoodFilterState> emit
  ) {
    emit(state.copyWith(
      isCongentialDeceaseSelected: false,
      isFoodAllergiesSelected: false,
      selectedTypes: [],
      minimumCalories: '',
      maximumCalories: ''
    ));
  }

  void _onFilterSearchButtonTapped(
    FoodFilterSearchButtonTapped event,
    Emitter<FoodFilterState> emit
  ) {
    
  }
}