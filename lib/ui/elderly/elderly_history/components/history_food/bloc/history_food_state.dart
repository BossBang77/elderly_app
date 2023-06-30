part of 'history_food_bloc.dart';

class HistoryFoodState extends Equatable {
  HistoryFoodState({
    this.currentRange = GraphRangeType.oneWeek,
    this.currentTab = HistoryFoodTab.summary,
    this.currentNutrient = 'P',
  });

  final GraphRangeType currentRange;
  final HistoryFoodTab currentTab;
  final String currentNutrient;

  HistoryFoodState copyWith({
    GraphRangeType? currentRange,
    HistoryFoodTab? currentTab,
    String? currentNutrient,
  }) =>
      HistoryFoodState(
        currentRange: currentRange ?? this.currentRange,
        currentTab: currentTab ?? this.currentTab,
        currentNutrient: currentNutrient ?? this.currentNutrient,
      );

  @override
  List<Object> get props => [currentRange, currentTab, currentNutrient];
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
