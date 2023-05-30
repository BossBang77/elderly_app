part of 'exercise_bloc.dart';

class ExerciseEvent extends Equatable {
  const ExerciseEvent();

  @override
  List<Object> get props => [];
}

class ChangeView extends ExerciseEvent {
  final ExerciseView exerciseView;
  const ChangeView({this.exerciseView = ExerciseView.summary});
  @override
  List<Object> get props => [exerciseView];
}

class ExerciseVdoFinish extends ExerciseEvent {
  final String time;
  const ExerciseVdoFinish({this.time = ''});
  @override
  List<Object> get props => [time];
}
