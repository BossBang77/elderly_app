part of 'history_food_bloc.dart';

class HistoryFoodState extends Equatable {
  HistoryFoodState({
    this.currentRange = GraphRangeType.oneWeek,
    this.currentTab = HistoryFoodTab.summary,
    this.currentNutrient = 'P',
    this.selectedDate = '',
  });

  final GraphRangeType currentRange;
  final HistoryFoodTab currentTab;
  final String currentNutrient;
  final String selectedDate;

  HistoryFoodState copyWith({
    GraphRangeType? currentRange,
    HistoryFoodTab? currentTab,
    String? currentNutrient,
    String? selectedDate,
  }) =>
      HistoryFoodState(
        currentRange: currentRange ?? this.currentRange,
        currentTab: currentTab ?? this.currentTab,
        currentNutrient: currentNutrient ?? this.currentNutrient,
        selectedDate: selectedDate ?? this.selectedDate,
      );

  @override
  List<Object> get props =>
      [currentRange, currentTab, currentNutrient, selectedDate];
}

class HistoryFoodInitial extends HistoryFoodState {}

enum GraphRangeType {
  oneWeek,
  oneMonth,
}

enum HistoryFoodTab {
  summary,
  history,
}

enum LunchIcon {
  breakfast,
  lunch,
  snack,
  dinner,
}
