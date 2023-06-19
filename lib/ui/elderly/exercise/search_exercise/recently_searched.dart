import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class RecentlySearched extends StatelessWidget {
  const RecentlySearched({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textSubtitle18Blod('รายการที่ค้นหาล่าสุด', ColorTheme().black87),
            if (state.recentlyList.isEmpty) ...{
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 20),
                child: textSubtitle15w400(
                  'ไม่พบรายการค้นหาล่าสุด',
                  color.grey50,
                ),
              )
            },
            Wrap(
              children: [
                for (var item in state.recentlyList)
                  InkWell(
                    onTap: () {
                      context.read<ExerciseBloc>()
                        ..add(OnFilter(type: FilterType.keyWord, value: item));
                      context.read<ExerciseBloc>()..add(SearchExercise());
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 10, right: 10),
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        decoration: BoxDecoration(
                            color: color.grey10,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: color.GreyBorder)),
                        child: textSubtitle16Blod(item, color.BlueDark)),
                  )
              ],
            )
          ],
        );
      },
    );
  }
}
