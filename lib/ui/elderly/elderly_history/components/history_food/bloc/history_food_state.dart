part of 'history_food_bloc.dart';

class HistoryFoodState extends Equatable {
  const HistoryFoodState({
    this.currentRange = GraphRangeType.oneWeek,
    this.currentTab = HistoryFoodTab.summary,
    this.currentNutrient = 'Protein',
    this.selectedDate = '',
    this.graphStartDate = '',
    this.graphEndDate = '',
    this.graphLoading = false,
    this.historyLoading = false,
    this.foodData = const ElderlyFoodModel(),
    this.foodLogData = const ElderlyLogFoodModel(),
  });

  const HistoryFoodState.initial() : this();

  final GraphRangeType currentRange;
  final HistoryFoodTab currentTab;
  final String currentNutrient;
  final String selectedDate;
  final String graphStartDate;
  final String graphEndDate;
  final bool graphLoading;
  final bool historyLoading;
  final ElderlyFoodModel foodData;
  final ElderlyLogFoodModel foodLogData;

  HistoryFoodState copyWith({
    GraphRangeType? currentRange,
    HistoryFoodTab? currentTab,
    String? currentNutrient,
    String? selectedDate,
    String? graphStartDate,
    String? graphEndDate,
    bool? graphLoading,
    bool? historyLoading,
    ElderlyFoodModel? foodData,
    ElderlyLogFoodModel? foodLogData,
  }) =>
      HistoryFoodState(
        currentRange: currentRange ?? this.currentRange,
        currentTab: currentTab ?? this.currentTab,
        currentNutrient: currentNutrient ?? this.currentNutrient,
        selectedDate: selectedDate ?? this.selectedDate,
        graphStartDate: graphStartDate ?? this.graphStartDate,
        graphEndDate: graphEndDate ?? this.graphEndDate,
        graphLoading: graphLoading ?? this.graphLoading,
        historyLoading: historyLoading ?? this.historyLoading,
        foodData: foodData ?? this.foodData,
        foodLogData: foodLogData ?? this.foodLogData,
      );

  @override
  List<Object> get props => [
        currentRange,
        currentTab,
        currentNutrient,
        selectedDate,
        graphStartDate,
        graphEndDate,
        graphLoading,
        historyLoading,
        foodData,
        foodLogData
      ];
}

class HistoryFoodInitial extends HistoryFoodState {}
