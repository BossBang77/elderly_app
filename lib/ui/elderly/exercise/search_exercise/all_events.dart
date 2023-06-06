import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/elderly/exercise/component/not_found_exercise.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

class AllEvent extends StatelessWidget {
  const AllEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExerciseBloc, ExerciseState>(
        listener: (context, state) {},
        builder: (BuildContext parent, ExerciseState state) {
          return initialWidget(context, state);
        });
  }

  Widget initialWidget(BuildContext context, ExerciseState state) {
    var exList = state.searchRes.data;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textSubtitle18Blod('กิจกรรมทั้งหมด', ColorTheme().black87),
        const SizedBox(
          height: 10,
        ),
        if (exList.isEmpty) ...{NotFoundExceriseList()},
        Column(
          children: [
            for (int i = 0; i < exList.length; i++)
              InkWell(
                onTap: () {
                  context
                      .read<ExerciseBloc>()
                      .add(SearchExInformation(exCode: exList[i].code));
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
                                  child: Image.network(
                                    exList[i].image,
                                    width: 75,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textSubtitle16Blod(
                                      exList[i].name, color.black87),
                                  textButton1(
                                      '${exList[i].burnCalorie.toString()} kcal (${exList[i].time} นาที)',
                                      color.black87)
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
