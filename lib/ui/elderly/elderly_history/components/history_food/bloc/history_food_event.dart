part of 'history_food_bloc.dart';

class HistoryFoodEvent extends Equatable {
  const HistoryFoodEvent();

  @override
  List<Object> get props => [];
}

class GetSummaryFood extends HistoryFoodEvent {
  const GetSummaryFood();
}

class GetHistoryLogFood extends HistoryFoodEvent {
  const GetHistoryLogFood();
}

class onTabChange extends HistoryFoodEvent {
  const onTabChange({required this.tabIndex});

  final int tabIndex;
}

class onFrequencyChange extends HistoryFoodEvent {
  const onFrequencyChange({required this.type});

  final GraphRangeType type;
}

class onNutrientsChange extends HistoryFoodEvent {
  const onNutrientsChange({required this.code});
  final String code;
}

class onSelectDateChange extends HistoryFoodEvent {
  const onSelectDateChange({required this.date});
  final String date;
}

class InitialData extends HistoryFoodEvent {
  const InitialData();
}
