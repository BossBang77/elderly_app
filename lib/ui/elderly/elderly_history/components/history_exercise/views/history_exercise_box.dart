import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_exercise/model/elderly_exercise_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class HistoryExerciseBox extends StatelessWidget {
  const HistoryExerciseBox({
    super.key,
    required this.exercises,
  });

  final List<ElderlyExerciseModel> exercises;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      margin: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: color.grey10, width: 0.7),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: color.white),
      child: Column(
        children: [
          if (exercises.isNotEmpty) ...{
            for (var item in exercises) ...{
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.asset(
                      'assets/images/exercise_image.png',
                      fit: BoxFit.contain,
                      scale: 3,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textSubtitle16W500(item.exerciseName, color.black87),
                      textSubtitle15w400(
                          '${item.time} นาที : ${item.calories} kcal ',
                          color.black87),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            },
          } else ...{
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/no_exercise.png',
                  scale: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: textSubtitle16Blod(
                      'ไม่มีบันทึกการออกกำลังกาย', color.greyText),
                ),
              ],
            )
          },
        ],
      ),
    );
  }
}
