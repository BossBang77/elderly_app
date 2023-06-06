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

class SearchExercise extends ExerciseEvent {
  const SearchExercise();
  @override
  List<Object> get props => [];
}

class OnFilter extends ExerciseEvent {
  final FilterType type;
  final dynamic value;
  final int index;
  const OnFilter({required this.type, this.value = '', this.index = 0});
  @override
  List<Object> get props => [type, value, index];
}

class Initial extends ExerciseEvent {
  const Initial();
}

class SearchExInformation extends ExerciseEvent {
  final String exCode;
  const SearchExInformation({required this.exCode});
  @override
  List<Object> get props => [exCode];
}
