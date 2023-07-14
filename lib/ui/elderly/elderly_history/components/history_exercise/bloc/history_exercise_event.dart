part of 'history_exercise_bloc.dart';

class HistoryExerciseEvent extends Equatable {
  const HistoryExerciseEvent();

  @override
  List<Object> get props => [];
}

class OnTabChange extends HistoryExerciseEvent {
  const OnTabChange({required this.tabIndex});

  final int tabIndex;
}

class OnFrequencyChange extends HistoryExerciseEvent {
  const OnFrequencyChange({required this.type});

  final GraphRangeType type;
}

class OnSelectDateChange extends HistoryExerciseEvent {
  const OnSelectDateChange({required this.date});
  final String date;
}

class GetHistoryExercise extends HistoryExerciseEvent {
  const GetHistoryExercise();
}

class GetHistoryLogExercise extends HistoryExerciseEvent {
  const GetHistoryLogExercise();
}

class InitialData extends HistoryExerciseEvent {
  const InitialData();
}
