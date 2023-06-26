import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/widget/button_blue_fade.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/image_notfound.dart';
import 'package:health_application/ui/base/widget/page_scroll.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/elderly/exercise/search_exercise/filter_event.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

class ExerciseDetail extends StatelessWidget {
  const ExerciseDetail({super.key, required this.state});
  final ExerciseState state;
  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    var currentDetail = state.currentInformation;
    return Scaffold(
      body: PageScroll(
        bgColor: ColorTheme().grey10.withOpacity(0.1),
        imgPath: currentDetail.image,
        isNetWork: true,
        leading: Container(
          child: InkWell(
            onTap: () {
              if (state.statusView == StatusViewExercise.caseNew) {
                context
                    .read<ExerciseBloc>()
                    .add(ChangeView(exerciseView: ExerciseView.search));
              } else {
                context.go(Routes.home);
              }
            },
            child: Image.asset(
              'assets/images/back_icon_outline.png',
              scale: 4,
            ),
          ),
        ),
        child: Container(
          color: ColorTheme().grey10.withOpacity(0.1),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            height: sized.height,
            width: sized.width,
            decoration: BoxDecoration(
                color: color.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  textSubtitle18Blod(currentDetail.name, ColorTheme().black87),
                  textH7(
                    currentDetail.type,
                    color.grey50,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textSubtitle2(
                      currentDetail.description, color.black87, false),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    decoration: BoxDecoration(
                        color: color.grey10,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/icon_exercise_outline.png',
                              scale: 3.5,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            textSubtitle16Blod('ออกกำลังกาย', color.black87)
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: color.grey50,
                        ),
                        textSubtitle16Blod('ระยะเวลา', color.black87),
                        textSubtitle15w400(
                            'ระบุระยะเวลาที่คุณออกกำลังกาย', Colors.grey),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: sized.width,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: color.BlueBackGround,
                              border: Border.all(
                                  color: color.Blue2.withOpacity(0.7)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                              child: textSubtitle16Blod(
                                  '${currentDetail.time} นาที', color.Blue2)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textSubtitle16Blod('แคลอรี่', color.black87),
                                textSubtitle15w400(
                                    'แคลอรี่ที่คุณจะได้รับ', Colors.grey),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/burn.png',
                                  scale: 4,
                                  color: color.Blue2,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                textSubtitle16Blod(
                                    currentDetail.burnCalorie.toString(),
                                    color.Blue2)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (state.role != RoleType.ROLE_USER_VOLUNTEER.name)
                    Row(
                      children: [
                        Flexible(
                            flex: 2,
                            child: ButtonGradient(
                              btnName: 'เริ่มต้นออกกำลังกาย',
                              onClick: () {
                                if (!checkIsSaveRecord(state.recordList,
                                    state.currentInformation.code)) {
                                  context.read<ExerciseBloc>().add(
                                      SaveExerciseRecordBeforeExerise(
                                          code: state.currentInformation.code,
                                          name: state.currentInformation.name));
                                }

                                context.read<ExerciseBloc>().add(ChangeView(
                                    exerciseView: ExerciseView.vdoExercise));
                              },
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        if (!checkIsSaveRecord(
                            state.recordList, state.currentInformation.code))
                          Flexible(
                              child: ButtonBlueFade(
                            btnName: 'บันทึก',
                            onClick: () {
                              context.read<ExerciseBloc>().add(
                                  SaveExerciseRecord(
                                      code: state.currentInformation.code,
                                      name: state.currentInformation.name));
                            },
                          ))
                      ],
                    ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
