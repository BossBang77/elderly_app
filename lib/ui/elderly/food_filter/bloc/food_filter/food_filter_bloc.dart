import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/food_filter_event.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/food_filter_state.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/state_restorable.dart';
import 'package:health_application/ui/register_profile/model/sub_menu_model.dart';

class FoodFilterBloc extends Bloc<FoodFilterEvent, FoodFilterState> {
  FoodFilterBloc(StateRestorable<FoodFilterState> foodStateRestorer)
      : foodStateRestorer = foodStateRestorer,
        super(const FoodFilterState.initial()) {
    on<FoodFilterCongentialDeceaseToggled>(_onCongentialDeceaseToggled);
    on<FoodFilterFoodAllergiesToggled>(_onFoodAllergiesToggled);
    on<FoodFilterFoodTypeSelected>(_onFoodTypeSelected);
    on<FoodFilterMinimumCaloriesTextFieldValueChanged>(
        _onMinimumCaloriesTextFieldValueChanged);
    on<FoodFilterMaximumCaloriesTextFieldValueChanged>(
        _onMaximumCaloriesTextFieldValueChanged);
    on<FoodFilterClearButtonTapped>(_onFilterClearButtonTapped);
    on<FoodFilterSearchButtonTapped>(_onFilterSearchButtonTapped);
    on<FoodFilterSnapshotCreated>(_onFoodFilterSnapshotCreated);
    on<FoodFilterStateRestored>(_onFoodFilterStateRestored);
    on<FoodFilterSetSelectedDisease>(_onFoodFilterSetSelectedDisease);
    on<FoodFilterSetSelectedFoodAllergy>(_onFoodFilterSetSelectedFoodAllergy);
  }

  StateRestorable<FoodFilterState> foodStateRestorer;

  void _onFoodFilterStateRestored(
      FoodFilterStateRestored event, Emitter<FoodFilterState> emit) {
    FoodFilterState snapshot = foodStateRestorer.restoreState();
    emit(state.copyWith(
        isCongentialDeceaseSelected: snapshot.isCongentialDeceaseSelected,
        isFoodAllergiesSelected: snapshot.isFoodAllergiesSelected,
        foodTypes: snapshot.foodTypes,
        selectedTypes: snapshot.selectedTypes,
        minimumCalories: snapshot.minimumCalories,
        maximumCalories: snapshot.maximumCalories));
  }

  void _onFoodFilterSnapshotCreated(
      FoodFilterSnapshotCreated event, Emitter<FoodFilterState> emit) {
    foodStateRestorer.createSnapshot(state);
  }

  void _onCongentialDeceaseToggled(
      FoodFilterCongentialDeceaseToggled event, Emitter<FoodFilterState> emit) {
    emit(state.copyWith(
        isCongentialDeceaseSelected: event.isCongentialDeceaseSelected));
  }

  void _onFoodAllergiesToggled(
      FoodFilterFoodAllergiesToggled event, Emitter<FoodFilterState> emit) {
    emit(state.copyWith(
      isFoodAllergiesSelected: event.isFoodAllergiesSelected,
    ));
  }

  void _onFoodTypeSelected(
      FoodFilterFoodTypeSelected event, Emitter<FoodFilterState> emit) {
    List<SubMenuModel> newSelectedType =
        _handleFoodTypeSelected(state.selectedTypes, event.foodTypes);
    emit(state.copyWith(selectedTypes: newSelectedType));
  }

  List<SubMenuModel> _handleFoodTypeSelected(
      List<SubMenuModel> foodTypeList, SubMenuModel newValue) {
    List<SubMenuModel> newFoodTypeList = List.from(foodTypeList);
    if (newFoodTypeList.any((element) => element.code == newValue.code)) {
      newFoodTypeList.removeWhere((element) => element.code == newValue.code);
    } else {
      newFoodTypeList.add(newValue);
    }
    return newFoodTypeList;
  }

  void _onMinimumCaloriesTextFieldValueChanged(
      FoodFilterMinimumCaloriesTextFieldValueChanged event,
      Emitter<FoodFilterState> emit) {
    emit(state.copyWith(minimumCalories: event.minimumCalories));
  }

  void _onMaximumCaloriesTextFieldValueChanged(
      FoodFilterMaximumCaloriesTextFieldValueChanged event,
      Emitter<FoodFilterState> emit) {
    emit(state.copyWith(maximumCalories: event.maximumCalories));
  }

  void _onFilterClearButtonTapped(
      FoodFilterClearButtonTapped event, Emitter<FoodFilterState> emit) {
    emit(state.copyWith(
        isCongentialDeceaseSelected: false,
        isFoodAllergiesSelected: false,
        selectedDisease: [],
        selectedFoodAllergy: [],
        selectedTypes: [],
        minimumCalories: '',
        maximumCalories: ''));
  }

  void _onFilterSearchButtonTapped(
      FoodFilterSearchButtonTapped event, Emitter<FoodFilterState> emit) {}

  void _onFoodFilterSetSelectedDisease(
      FoodFilterSetSelectedDisease event, Emitter<FoodFilterState> emit) {
    emit(state.copyWith(selectedDisease: event.diseases));
  }

  void _onFoodFilterSetSelectedFoodAllergy(
      FoodFilterSetSelectedFoodAllergy event, Emitter<FoodFilterState> emit) {
    emit(state.copyWith(selectedFoodAllergy: event.foodAllergy));
  }
}
