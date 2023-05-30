part of 'exercise_bloc.dart';

class ExerciseState extends Equatable {
  const ExerciseState(
      {this.exerciseView = ExerciseView.summary, this.timeExercise = ''});
  final ExerciseView exerciseView;
  final String timeExercise;
  ExerciseState copyWith({ExerciseView? exerciseView, String? timeExercise}) {
    return ExerciseState(
        exerciseView: exerciseView ?? this.exerciseView,
        timeExercise: timeExercise ?? this.timeExercise);
  }

  @override
  List<Object> get props => [exerciseView, timeExercise];
}

class ExerciseInitial extends ExerciseState {}

enum ExerciseView {
  summary,
  search,
  filterEvent,
  exerciseDetail,
  calculate,
  vdoExercise
}

var typeOfExerciseList = [
  'แบบเกร็งกล้ามเนื้ออยู่กับที่ไม่มีการเคลื่อนไหว',
  'แบบทําให้กล้ามเนื้อทํางานเป็นไปอย่างสม่ำเสมอตลอดการเคลื่อนไหว ',
  'แบบใช้ออกซิเจน ',
  'แบบไม่ต้องใช้ออกซิเจน ในระหว่างที่มีการเคลื่อนไหว',
  'แบบมีการยืด-หดตัวของกล้ามเนื้อ '
];
