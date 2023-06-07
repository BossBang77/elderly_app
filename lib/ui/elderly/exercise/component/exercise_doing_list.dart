import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/elderly/exercise/model/search_res_list.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

Widget ExerciseDoingList(BuildContext context, SearchResListModel list) {
  var recordList = list.data;
  return Column(
    children: [
      for (int i = 0; i < recordList.length; i++)
        InkWell(
          onTap: () {
            context.read<ExerciseBloc>().add(SearchExInformation(
                exCode: recordList[i].code,
                statusViewExercise: StatusViewExercise.caseResume));
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
                              recordList[i].image,
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
                                recordList[i].name, color.black87),
                            textSubtitle15w400(
                                '${recordList[i].time.toString()} นาที : ${recordList[i].burnCalorie}kcal',
                                color.black87)
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<ExerciseBloc>()
                            .add(RemoveExerciseRecord(id: recordList[i].id));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/images/exit_icon.png',
                          scale: 4,
                        ),
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
  );
}
