part of 'history_exercise_bloc.dart';

class HistoryExerciseState extends Equatable {
  const HistoryExerciseState({
    this.currentRange = GraphRangeType.oneWeek,
    this.currentTab = HistoryExerciseTab.summary,
  });

  final GraphRangeType currentRange;
  final HistoryExerciseTab currentTab;

  HistoryExerciseState copyWith({
    GraphRangeType? currentRange,
    HistoryExerciseTab? currentTab,
  }) =>
      HistoryExerciseState(
        currentRange: currentRange ?? this.currentRange,
        currentTab: currentTab ?? this.currentTab,
      );

  @override
  List<Object> get props => [currentRange, currentTab];
}

class HistoryExerciseInitial extends HistoryExerciseState {}

enum HistoryExerciseTab {
  summary,
  history,
}
