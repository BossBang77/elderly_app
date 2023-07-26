import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/elderly/exercise/exercise_widget.dart';
import 'package:health_application/ui/elderly/exercise/search_exercise/search_exercise_widget.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

import '../../../base/routes.dart';
import '../../../base/widget/button_orange.dart';
import '../../../base/widget/text_field_widget.dart';
import '../../../home_page/bloc/home_page_bloc.dart';
import '../component/exercise_doing_list.dart';
import '../component/not_found_exercise.dart';

class SummaryExerciseWidget extends StatelessWidget {
  const SummaryExerciseWidget({super.key, required this.state});
  final ExerciseState state;
  @override
  Widget build(BuildContext context) {
    var exerciseDaily = state.exerciseDaily;
    var exerciseRecord = state.recordList;
    return Scaffold(
      backgroundColor: color.whiteBackground,
      appBar: appBar(
          onBack: () {
            context
                .read<HomePageBloc>()
                .add(ChangeMenu(menus: menuType.mainPage));
          },
          title: 'ออกกำลังกาย',
          showNotification: true),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (() {
                  context.read<ExerciseBloc>().add(SearchExercise());

                  context
                      .read<ExerciseBloc>()
                      .add(ChangeView(exerciseView: ExerciseView.search));
                  context.go(Routes.exerciseWidget);
                }),
                child: TextFieldWidget.enable(
                  text: '',
                  readOnly: true,
                  enable: false,
                  maxLength: 100,
                  hintText: 'ค้นหาการออกกำลังกาย',
                  prefix: true,
                  imagePathPrefix: 'assets/images/search_icon.png',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Image.asset(
                    'assets/images/exercise_bg.png',
                    scale: 3,
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textSubtitle18Blod(
                            'วันนี้, ${DateTime.now().toDisplayFullBuddishDate(locale: 'th')}',
                            ColorTheme().white),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/burning_icon.png',
                                  scale: 4,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textButton1('เผาผลาญ ', color.white),
                                    textSubtitle18Blod(
                                        '${exerciseDaily.burnCaloriePoint.toString()} kcal',
                                        color.white)
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/images/time_icon.png',
                                  scale: 4,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textButton1('ระยะเวลา', color.white),
                                    textSubtitle18Blod(
                                        '${exerciseDaily.timePoint.toStringAsFixed(2)} นาที',
                                        color.white)
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              textSubtitle18Blod('บันทึกการออกกำลังกาย', ColorTheme().black87),
              const SizedBox(
                height: 20,
              ),
              ButtonOrange(
                btnName: 'เพิ่มรายการใหม่',
                onClick: () {
                  context.read<ExerciseBloc>().add(SearchExercise());
                  context
                      .read<ExerciseBloc>()
                      .add(ChangeView(exerciseView: ExerciseView.search));

                  context.go(Routes.exerciseWidget);
                },
              ),
              const SizedBox(
                height: 40,
              ),
              if (exerciseRecord.data.isEmpty) ...{
                NotFoundExcerise()
              } else ...{
                ExerciseDoingList(context, exerciseRecord)
              },
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
