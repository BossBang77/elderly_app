import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/repository/elderly_history_repos.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_exercise/model/elderly_exercise_model.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_exercise/model/elderly_history_exercise_model.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_exercise/model/elderly_history_exercise_response.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_exercise/model/elderly_log_exercise_response.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/common/item_constant.dart';

part 'history_exercise_event.dart';
part 'history_exercise_state.dart';

class HistoryExerciseBloc
    extends Bloc<HistoryExerciseEvent, HistoryExerciseState> {
  HistoryExerciseBloc() : super(HistoryExerciseInitial()) {
    ElderlyHistoryRepository elderlyHistoryRepository =
        ElderlyHistoryRepository();
    on<HistoryExerciseEvent>((event, emit) async {
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
      if (event is GetHistoryExercise) {
        emit(state.copyWith(graphLoading: true));
        final response = await elderlyHistoryRepository.getSummaryExercise(
            state.graphStartDate, state.graphEndDate);
        response.fold((l) {
          emit(state.copyWith(graphLoading: false));
        }, (ElderlyHistoryExerciseResponse res) {
          emit(state.copyWith(exerciseData: res.data, graphLoading: false));
        });
      }
      if (event is GetHistoryLogExercise) {
        emit(state.copyWith(graphLoading: true));
        final response = await elderlyHistoryRepository
            .getHistoryLogExercise(state.selectedDate);
        response.fold((l) {
          emit(state.copyWith(graphLoading: false));
        }, (ElderlyLogExerciseResponse res) {
          emit(state.copyWith(exerciseLogData: res.data, graphLoading: false));
        });
      }
    });
  }
}
