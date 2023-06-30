part of 'history_drinking_bloc.dart';

class HistoryDrinkingState extends Equatable {
  HistoryDrinkingState({
    this.currentRange = GraphRangeType.oneWeek,
    this.currentTab = HistoryDrinkingTab.summary,
    this.selectedDate = '',
  });

  final GraphRangeType currentRange;
  final HistoryDrinkingTab currentTab;
  final String selectedDate;

  HistoryDrinkingState copyWith({
    GraphRangeType? currentRange,
    HistoryDrinkingTab? currentTab,
    String? selectedDate,
  }) =>
      HistoryDrinkingState(
        currentRange: currentRange ?? this.currentRange,
        currentTab: currentTab ?? this.currentTab,
        selectedDate: selectedDate ?? this.selectedDate,
      );

  @override
  List<Object> get props => [currentRange, currentTab, selectedDate];
}

class HistoryDrinkingInitial extends HistoryDrinkingState {}

enum HistoryDrinkingTab {
  summary,
  history,
}
