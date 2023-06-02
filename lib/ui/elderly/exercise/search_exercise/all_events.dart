import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

class AllEvent extends StatelessWidget {
  const AllEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textSubtitle18Blod('กิจกรรมทั้งหมด', ColorTheme().black87),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            for (int i = 0; i < 10; i++)
              InkWell(
                onTap: () {
                  context.read<ExerciseBloc>().add(
                      ChangeView(exerciseView: ExerciseView.exerciseDetail));
                },
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/example_person_exercise.png',
                                  width: 75,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textSubtitle16Blod(
                                      'กายบริหาร ${i + 1}', color.black87),
                                  textButton1('30.01 นาที', color.black87)
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Image.asset(
                              'assets/images/next_arrow.png',
                              scale: 4,
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: color.grey50,
                      )
                    ],
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }
}
