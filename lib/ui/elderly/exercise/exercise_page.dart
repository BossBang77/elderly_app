import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/elderly/exercise/exercise_widget.dart';
import 'package:health_application/ui/elderly/exercise/summary_exercise/summary_exercise.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ExerciseBloc>().add(Initial());
    return BlocConsumer<ExerciseBloc, ExerciseState>(
        listener: (context, state) async {
      if (state.statusSubmit == StatusSubmit.getInformationSuccess) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => ExerciseWidget()),
            (Route<dynamic> route) => false);
      }

      if (state.statusSubmit == StatusSubmit.getInformationFail) {
        final bool acceptClose = await showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertWidget(
                  title: 'เกิดข้อผิดพลาด',
                  subTitle:
                      "มีบางอย่างผิดพลาดในการดึงข้อมูล\nกรุณาลองใหม่อีกครั้ง",
                  btnName: 'ตกลง',
                )) as bool;

        if (acceptClose) {
          context
              .read<ExerciseBloc>()
              .add(UpdateSubmitStatus(status: StatusSubmit.initial));
        }
      }

      if (state.statusSubmit == StatusSubmit.removeExerciseRecordFail) {
        final bool acceptClose = await showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertWidget(
                  title: 'เกิดข้อผิดพลาด',
                  subTitle:
                      "มีบางอย่างผิดพลาดในการลบข้อมูล\nกรุณาลองใหม่อีกครั้ง",
                  btnName: 'ตกลง',
                )) as bool;

        if (acceptClose) {
          context
              .read<ExerciseBloc>()
              .add(UpdateSubmitStatus(status: StatusSubmit.initial));
        }
      }

      if (state.statusSubmit == StatusSubmit.saveExerciseDailyFail) {
        final bool acceptClose = await showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertWidget(
                  title: 'เกิดข้อผิดพลาด',
                  subTitle: "บันทึกข้อมูลไม่สำเร็จ\nกรุณาลองใหม่อีกครั้ง",
                  btnName: 'ตกลง',
                )) as bool;

        if (acceptClose) {
          context
              .read<ExerciseBloc>()
              .add(UpdateSubmitStatus(status: StatusSubmit.initial));
        }
      }
    }, builder: (BuildContext parent, ExerciseState state) {
      return SummaryExerciseWidget(
        state: state,
      );
    });
  }
}
