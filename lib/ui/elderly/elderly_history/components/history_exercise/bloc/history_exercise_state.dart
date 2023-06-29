part of 'history_exercise_bloc.dart';

class HistoryExerciseState extends Equatable {
  const HistoryExerciseState({
    this.currentRange = GraphRangeType.oneWeek,
    this.currentTab = HistoryExerciseTab.summary,
    this.selectedDate = '',
  });

  final GraphRangeType currentRange;
  final HistoryExerciseTab currentTab;
  final String selectedDate;

  HistoryExerciseState copyWith({
    GraphRangeType? currentRange,
    HistoryExerciseTab? currentTab,
    String? selectedDate,
  }) =>
      HistoryExerciseState(
        currentRange: currentRange ?? this.currentRange,
        currentTab: currentTab ?? this.currentTab,
        selectedDate: selectedDate ?? this.selectedDate,
      );

  @override
  List<Object> get props => [currentRange, currentTab, selectedDate];
}

class HistoryExerciseInitial extends HistoryExerciseState {}

enum HistoryExerciseTab {
  summary,
  history,
}
