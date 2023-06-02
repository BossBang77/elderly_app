import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ExerciseBloc() : super(ExerciseInitial()) {}

  @override
  Stream<ExerciseState> mapEventToState(ExerciseEvent event) async* {
    if (event is ChangeView) {
      yield state.copyWith(exerciseView: event.exerciseView);
    }

    if (event is ExerciseVdoFinish) {
      yield state.copyWith(
          timeExercise: event.time, exerciseView: ExerciseView.calculate);
    }
  }
}
