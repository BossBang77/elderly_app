import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/elderly/exercise/exercise_detail/exercise_calculate.dart';
import 'package:health_application/ui/elderly/exercise/exercise_detail/exercise_detail.dart';
import 'package:health_application/ui/elderly/exercise/exercise_detail/exercise_vdo_player.dart';
import 'package:health_application/ui/elderly/exercise/search_exercise/search_exercise_widget.dart';

class ExerciseWidget extends StatelessWidget {
  const ExerciseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExerciseBloc, ExerciseState>(
        listener: (context, state) {},
        builder: (BuildContext parent, ExerciseState state) {
          if (state.exerciseView == ExerciseView.search) {
            return SearchExerciseWidget();
          } else if (state.exerciseView == ExerciseView.exerciseDetail) {
            return ExerciseDetail();
          } else if (state.exerciseView == ExerciseView.calculate) {
            return ExerciseCalculate(
              timeExercise: state.timeExercise,
            );
          } else if (state.exerciseView == ExerciseView.vdoExercise) {
            return ExerciseVdoPlayer();
          } else {
            return Container();
          }
        });
  }
}
