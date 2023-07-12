part of 'history_drinking_bloc.dart';

class HistoryDrinkingEvent extends Equatable {
  const HistoryDrinkingEvent();

  @override
  List<Object> get props => [];
}

class OnTabChange extends HistoryDrinkingEvent {
  const OnTabChange({required this.tabIndex});

  final int tabIndex;
}

class OnFrequencyChange extends HistoryDrinkingEvent {
  const OnFrequencyChange({required this.type});

  final GraphRangeType type;
}

class OnSelectDateChange extends HistoryDrinkingEvent {
  const OnSelectDateChange({required this.date});
  final String date;
}

class GetSummaryDrinkingWater extends HistoryDrinkingEvent {
  const GetSummaryDrinkingWater();
}

class GetLogDrinkingWater extends HistoryDrinkingEvent {
  const GetLogDrinkingWater();
}
