part of 'history_drinking_bloc.dart';

class HistoryDrinkingState extends Equatable {
  HistoryDrinkingState({
    this.currentRange = GraphRangeType.oneWeek,
    this.currentTab = HistoryDrinkingTab.summary,
    this.selectedDate = '',
    this.graphStartDate = '',
    this.graphEndDate = '',
    this.graphLoading = false,
    this.historyLoading = false,
    this.drinkingData = const ElderlyHistoryDrinkingModel(),
    this.drinkingLogData = const [],
  });

  final GraphRangeType currentRange;
  final HistoryDrinkingTab currentTab;
  final String selectedDate;
  final String graphStartDate;
  final String graphEndDate;
  final bool graphLoading;
  final bool historyLoading;
  final ElderlyHistoryDrinkingModel drinkingData;
  final List<ElderlyDrinkingModel> drinkingLogData;

  HistoryDrinkingState copyWith(
          {GraphRangeType? currentRange,
          HistoryDrinkingTab? currentTab,
          String? selectedDate,
          String? graphStartDate,
          String? graphEndDate,
          bool? graphLoading,
          bool? historyLoading,
          ElderlyHistoryDrinkingModel? drinkingData,
          List<ElderlyDrinkingModel>? drinkingLogData}) =>
      HistoryDrinkingState(
        currentRange: currentRange ?? this.currentRange,
        currentTab: currentTab ?? this.currentTab,
        selectedDate: selectedDate ?? this.selectedDate,
        graphStartDate: graphStartDate ?? this.graphStartDate,
        graphEndDate: graphEndDate ?? this.graphEndDate,
        graphLoading: graphLoading ?? this.graphLoading,
        historyLoading: historyLoading ?? this.historyLoading,
        drinkingData: drinkingData ?? this.drinkingData,
        drinkingLogData: drinkingLogData ?? this.drinkingLogData,
      );

  @override
  List<Object> get props => [
        currentRange,
        currentTab,
        selectedDate,
        graphStartDate,
        graphEndDate,
        graphLoading,
        historyLoading,
        drinkingData,
        drinkingLogData,
      ];
}

class HistoryDrinkingInitial extends HistoryDrinkingState {}

enum HistoryDrinkingTab {
  summary,
  history,
}
