import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/common/item_constant.dart';

part 'history_exercise_event.dart';
part 'history_exercise_state.dart';

class HistoryExerciseBloc
    extends Bloc<HistoryExerciseEvent, HistoryExerciseState> {
  HistoryExerciseBloc() : super(HistoryExerciseInitial()) {
    on<HistoryExerciseEvent>((event, emit) {
      if (event is OnTabChange) {
        var ind = event.tabIndex;
        if (ind == 0) {
          emit(state.copyWith(currentTab: HistoryExerciseTab.summary));
        } else if (ind == 1) {
          emit(state.copyWith(currentTab: HistoryExerciseTab.history));
        }
      }
      if (event is OnFrequencyChange) {
        emit(state.copyWith(currentRange: event.type));
      }
      if (event is OnSelectDateChange) {
        emit(state.copyWith(selectedDate: event.date));
      }
    });
  }
}
