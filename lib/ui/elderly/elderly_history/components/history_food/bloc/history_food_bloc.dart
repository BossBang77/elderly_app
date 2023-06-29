import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_food_event.dart';
part 'history_food_state.dart';

class HistoryFoodBloc extends Bloc<HistoryFoodEvent, HistoryFoodState> {
  HistoryFoodBloc() : super(HistoryFoodInitial()) {
    on<HistoryFoodEvent>((event, emit) {
      if (event is onTabChange) {
        var ind = event.tabIndex;
        if (ind == 0) {
          emit(state.copyWith(currentTab: HistoryFoodTab.summary));
        } else if (ind == 1) {
          emit(state.copyWith(currentTab: HistoryFoodTab.history));
        }
      }
      if (event is onFrequencyChange) {
        emit(state.copyWith(currentRange: event.type));
      }

      if (event is onNutrientsChange) {
        emit(state.copyWith(currentNutrient: event.code));
      }

      if (event is onSelectDateChange) {
        emit(state.copyWith(selectedDate: event.date));
      }
    });
  }
}
