import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/repository/elderly_history_repos.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/common/item_constant.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/elderly_food_model.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/elderly_history_food_response.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/elderly_log_food_model.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/elderly_log_food_response.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/graph_model.dart';
import 'package:health_application/ui/extension/extension.dart';

part 'history_food_event.dart';
part 'history_food_state.dart';

class HistoryFoodBloc extends Bloc<HistoryFoodEvent, HistoryFoodState> {
  HistoryFoodBloc() : super(HistoryFoodInitial()) {
    ElderlyHistoryRepository elderlyHistoryRepository =
        ElderlyHistoryRepository();
    on<HistoryFoodEvent>((event, emit) async {
      if (event is InitialData) {
        var now = DateTime.now();
        var startDate =
            DateTime.utc(now.year, now.month, now.day - 7).toDisplayApiFormat();
        var endDate = DateTime.now().toDisplayApiFormat();
        emit(state.copyWith(graphStartDate: startDate, graphEndDate: endDate));
        add(GetSummaryFood());
      }
      if (event is GetSummaryFood) {
        emit(state.copyWith(graphLoading: true));
        final response = await elderlyHistoryRepository.getSummaryFood(
            state.graphStartDate, state.graphEndDate);
        response.fold((l) {
          emit(state.copyWith(graphLoading: false));
        }, (ElderlyHistoryModelResponse res) {
          emit(state.copyWith(foodData: res.data, graphLoading: false));
        });
      }
      if (event is GetHistoryLogFood) {
        emit(state.copyWith(graphLoading: true));
        final response = await elderlyHistoryRepository
            .getHistoryLogFood(state.selectedDate);
        response.fold((l) {
          emit(state.copyWith(graphLoading: false));
        }, (ElderlyLogFoodResponse res) {
          emit(state.copyWith(foodLogData: res.data, graphLoading: false));
        });
      }
      if (event is onTabChange) {
        var ind = event.tabIndex;
        if (ind == 0) {
          emit(state.copyWith(currentTab: HistoryFoodTab.summary));
          add(GetSummaryFood());
        } else if (ind == 1) {
          emit(state.copyWith(currentTab: HistoryFoodTab.history));
          add(GetHistoryLogFood());
        }
      }
      if (event is onFrequencyChange) {
        var today = DateTime.now();
        if (event.type == GraphRangeType.oneWeek) {
          emit(state.copyWith(
              graphStartDate: today.toDisplayApiFormat(),
              graphEndDate: DateTime.utc(today.year, today.month, today.day - 7)
                  .toDisplayApiFormat(),
              currentRange: event.type));
        } else {
          emit(state.copyWith(
              graphStartDate: today.toDisplayApiFormat(),
              graphEndDate: DateTime.utc(today.year, today.month - 1, today.day)
                  .toDisplayApiFormat(),
              currentRange: event.type));
        }
        add(GetSummaryFood());
      }

      if (event is onNutrientsChange) {
        emit(state.copyWith(currentNutrient: event.code));
      }

      if (event is onSelectDateChange) {
        emit(state.copyWith(selectedDate: event.date));
        add(GetHistoryLogFood());
      }
    });
  }
}
