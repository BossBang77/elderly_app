import 'package:health_application/ui/food/bloc/food_filter/food_filter_state.dart';

abstract class StateRestorable<State> {
  StateRestorable({required this.snapshot});

  State snapshot;

  void createSnapshot(State state);
  State restoreState();
}

class FoodFilterStateRestorer implements StateRestorable<FoodFilterState> {
  FoodFilterStateRestorer({this.snapshot = const FoodFilterState.initial()});

  @override
  FoodFilterState snapshot;

  @override
  void createSnapshot(FoodFilterState state) {
    snapshot = FoodFilterState(
      isCongentialDeceaseSelected: state.isCongentialDeceaseSelected, 
      isFoodAllergiesSelected: state.isFoodAllergiesSelected, 
      foodTypes: state.foodTypes, 
      selectedTypes: state.selectedTypes, 
      minimumCalories: state.minimumCalories, 
      maximumCalories: state.maximumCalories
    );
  }

  @override
  FoodFilterState restoreState() {
    return snapshot;
  }
}