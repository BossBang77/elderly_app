import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/elderly/exercise/exercise_detail/exercise_calculate.dart';
import 'package:health_application/ui/elderly/exercise/exercise_detail/exercise_detail.dart';
import 'package:health_application/ui/elderly/exercise/exercise_detail/exercise_vdo_player.dart';
import 'package:health_application/ui/elderly/exercise/search_exercise/search_exercise_widget.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';

class ExerciseWidget extends StatelessWidget {
  const ExerciseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Widget initial(BuildContext context, ExerciseState state) {
      if (state.exerciseView == ExerciseView.search) {
        return SearchExerciseWidget(
          state: state,
        );
      } else if (state.exerciseView == ExerciseView.exerciseDetail) {
        return ExerciseDetail(
          state: state,
        );
      } else if (state.exerciseView == ExerciseView.calculate) {
        return ExerciseCalculate(
          timeExercise: state.timeExercise,
          state: state,
        );
      } else if (state.exerciseView == ExerciseView.vdoExercise) {
        return ExerciseVdoPlayer(
          videoLink: state.currentInformation.video,
        );
      } else {
        return Container();
      }
    }

    return BlocConsumer<ExerciseBloc, ExerciseState>(
        listener: (context, state) async {
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

      if ((state.statusSubmit == StatusSubmit.saveRecordSuccess) ||
          state.statusSubmit == StatusSubmit.saveExerciseDailySuccess) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false);
      }

      if (state.statusSubmit == StatusSubmit.saveRecordFail ||
          state.statusSubmit == StatusSubmit.saveExerciseDailyFail) {
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
      return Stack(
        children: [
          initial(context, state),
          if (state.loading) ...{Loader()}
        ],
      );
    });
  }
}
