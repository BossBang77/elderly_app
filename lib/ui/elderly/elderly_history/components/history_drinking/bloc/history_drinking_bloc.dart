import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/repository/elderly_history_repos.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_drinking/model/elderly_drinking_model.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_drinking/model/elderly_history_drinking_model.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_drinking/model/elderly_history_drinking_response.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_drinking/model/elderly_log_drinking_response.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/common/item_constant.dart';
import 'package:health_application/ui/extension/extension.dart';

part 'history_drinking_event.dart';
part 'history_drinking_state.dart';

class HistoryDrinkingBloc
    extends Bloc<HistoryDrinkingEvent, HistoryDrinkingState> {
  HistoryDrinkingBloc() : super(HistoryDrinkingInitial()) {
    ElderlyHistoryRepository elderlyHistoryRepository =
        ElderlyHistoryRepository();
    on<HistoryDrinkingEvent>((event, emit) async {
      if (event is InitialData) {
        var now = DateTime.now();
        var startDate =
            DateTime.utc(now.year, now.month, now.day - 7).toDisplayApiFormat();
        var endDate = DateTime.now().toDisplayApiFormat();
        emit(state.copyWith(graphStartDate: startDate, graphEndDate: endDate));
        add(GetSummaryDrinkingWater());
      }
      if (event is GetSummaryDrinkingWater) {
        emit(state.copyWith(graphLoading: true));
        final response = await elderlyHistoryRepository.getSummaryDrinkingWater(
            state.graphStartDate, state.graphEndDate);
        response.fold((l) {
          emit(state.copyWith(graphLoading: false));
        }, (ElderlyHistoryDrinkingResponse res) {
          emit(state.copyWith(drinkingData: res.data, graphLoading: false));
        });
      }
      if (event is GetLogDrinkingWater) {
        emit(state.copyWith(graphLoading: true));
        final response = await elderlyHistoryRepository
            .getHistoryLogDrinkingWater(state.selectedDate);
        response.fold((l) {
          emit(state.copyWith(graphLoading: false));
        }, (ElderlyLogDrinkingResponse res) {
          emit(state.copyWith(drinkingLogData: res.data, graphLoading: false));
        });
      }
      if (event is OnTabChange) {
        var ind = event.tabIndex;
        if (ind == 0) {
          emit(state.copyWith(currentTab: HistoryDrinkingTab.summary));
          add(GetSummaryDrinkingWater());
        } else if (ind == 1) {
          emit(state.copyWith(currentTab: HistoryDrinkingTab.history));
          add(GetLogDrinkingWater());
        }
      }
      if (event is OnFrequencyChange) {
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
        add(GetSummaryDrinkingWater());
      }
      if (event is OnSelectDateChange) {
        emit(state.copyWith(selectedDate: event.date));
        add(GetLogDrinkingWater());
      }
    });
  }
}
