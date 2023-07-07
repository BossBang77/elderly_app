part of 'history_exercise_bloc.dart';

class HistoryExerciseState extends Equatable {
  const HistoryExerciseState({
    this.currentRange = GraphRangeType.oneWeek,
    this.currentTab = HistoryExerciseTab.summary,
    this.selectedDate = '',
    this.graphLoading = false,
    this.graphStartDate = '',
    this.graphEndDate = '',
    this.exerciseData = const ElderlyHistoryExerciseModel(),
    this.exerciseLogData = const [],
  });

  final GraphRangeType currentRange;
  final HistoryExerciseTab currentTab;
  final String selectedDate;
  final bool graphLoading;
  final String graphStartDate;
  final String graphEndDate;
  final ElderlyHistoryExerciseModel exerciseData;
  final List<ElderlyExerciseModel> exerciseLogData;

  HistoryExerciseState copyWith({
    GraphRangeType? currentRange,
    HistoryExerciseTab? currentTab,
    String? selectedDate,
    bool? graphLoading,
    String? graphStartDate,
    String? graphEndDate,
    ElderlyHistoryExerciseModel? exerciseData,
    List<ElderlyExerciseModel>? exerciseLogData,
  }) =>
      HistoryExerciseState(
        currentRange: currentRange ?? this.currentRange,
        currentTab: currentTab ?? this.currentTab,
        selectedDate: selectedDate ?? this.selectedDate,
        graphLoading: graphLoading ?? this.graphLoading,
        graphStartDate: graphStartDate ?? this.graphStartDate,
        graphEndDate: graphEndDate ?? this.graphEndDate,
        exerciseData: exerciseData ?? this.exerciseData,
        exerciseLogData: exerciseLogData ?? this.exerciseLogData,
      );

  @override
  List<Object> get props => [
        currentRange,
        currentTab,
        selectedDate,
        graphLoading,
        graphStartDate,
        graphEndDate,
        exerciseData,
        exerciseLogData
      ];
}

class HistoryExerciseInitial extends HistoryExerciseState {}

enum HistoryExerciseTab {
  summary,
  history,
}
