import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/elderly/exercise/exercise_detail/exercise_detail.dart';
import 'package:health_application/ui/elderly/exercise/search_exercise/filter_event.dart';
import 'package:health_application/ui/elderly/exercise/summary_exercise/summary_exercise.dart';

import 'search_exercise/search_exercise_widget.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExerciseBloc, ExerciseState>(
        listener: (context, state) {},
        builder: (BuildContext parent, ExerciseState state) {
          return SummaryExerciseWidget();
        });
  }
}
