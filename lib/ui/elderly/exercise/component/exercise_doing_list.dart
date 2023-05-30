import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ExerciseDoingList extends StatelessWidget {
  const ExerciseDoingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 1; i++)
          Container(
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
                            textSubtitle15w400(
                                '30.01 นาที : 649 kcal', color.black87)
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'assets/images/exit_icon.png',
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
      ],
    );
  }
}
