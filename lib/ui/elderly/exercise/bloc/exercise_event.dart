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
  final int inSeconds;
  const ExerciseVdoFinish({this.time = '', required this.inSeconds});
  @override
  List<Object> get props => [time, inSeconds];
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
  final StatusViewExercise statusViewExercise;
  const SearchExInformation(
      {required this.exCode,
      this.statusViewExercise = StatusViewExercise.caseNew});
  @override
  List<Object> get props => [exCode, statusViewExercise];
}

class UpdateSubmitStatus extends ExerciseEvent {
  final StatusSubmit status;
  const UpdateSubmitStatus({this.status = StatusSubmit.initial});
  @override
  List<Object> get props => [status];
}

class GetExerciseDaily extends ExerciseEvent {
  const GetExerciseDaily();
}

class RemoveExerciseRecord extends ExerciseEvent {
  final String id;
  const RemoveExerciseRecord({required this.id});
  @override
  List<Object> get props => [id];
}

class GetExerciseRecord extends ExerciseEvent {
  const GetExerciseRecord();
  @override
  List<Object> get props => [];
}

class SaveExerciseDaily extends ExerciseEvent {
  final String timePoint;
  final int timePointInSec;
  final String name;
  final String code;
  const SaveExerciseDaily(
      {required this.timePoint,
      required this.name,
      required this.code,
      required this.timePointInSec});
  List<Object> get props => [timePoint, name, code, timePointInSec];
}

class SubmitSearchKeyWord extends ExerciseEvent {
  final String keyWord;

  const SubmitSearchKeyWord({required this.keyWord});
  @override
  List<Object> get props => [keyWord];
}
