import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/common/item_constant.dart';

part 'history_drinking_event.dart';
part 'history_drinking_state.dart';

class HistoryDrinkingBloc
    extends Bloc<HistoryDrinkingEvent, HistoryDrinkingState> {
  HistoryDrinkingBloc() : super(HistoryDrinkingInitial()) {
    on<HistoryDrinkingEvent>((event, emit) {
      if (event is OnTabChange) {
        var ind = event.tabIndex;
        if (ind == 0) {
          emit(state.copyWith(currentTab: HistoryDrinkingTab.summary));
        } else if (ind == 1) {
          emit(state.copyWith(currentTab: HistoryDrinkingTab.history));
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
