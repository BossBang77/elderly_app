import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/widget/button_blue_fade.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/elderly/exercise/search_exercise/filter_event.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

class ExerciseDetail extends StatelessWidget {
  const ExerciseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Stack(children: <Widget>[
            Positioned.fill(
              child: Image(
                image: AssetImage('assets/images/example_vdo_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ]),
          Positioned(
              top: 60,
              left: 30,
              child: InkWell(
                onTap: () {
                  context
                      .read<ExerciseBloc>()
                      .add(ChangeView(exerciseView: ExerciseView.search));
                },
                child: Image.asset(
                  'assets/images/back_icon_outline.png',
                  scale: 4,
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              height: sized.height * 0.7,
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
                    textSubtitle18Blod('กายบริหาร', ColorTheme().black87),
                    textH7(
                      'แบบมีการยืด-หดตัวของกล้ามเนื้อ ',
                      color.grey50,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textSubtitle2(
                        'ทางเลือกสำหรับผู้ที่ต้องการออกกำลังกายที่ บ้าน โดยสามารถออกกำลังกายได้ทุกสัดส่วน พร้อมทั้งฝึกความอดทน การทรงตัว และ ความยืดหยุ่นของร่างกาย ซึ่งกายบริหารมีหลาย ท่าให้เลือกตามความเหมาะสม เช่น เหยียดน่อง เขย่งปลายเท้า ย่อเข่า โยกลำตัว เป็นต้น',
                        color.black87,
                        false),
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
                                child:
                                    textSubtitle16Blod('15 นาที', color.Blue2)),
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
                                  textSubtitle16Blod('15 นาที', color.Blue2)
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
                    Row(
                      children: [
                        Flexible(
                            flex: 2,
                            child: ButtonGradient(
                              btnName: 'เริ่มต้นออกกำลังกาย',
                              onClick: () {
                                context.read<ExerciseBloc>().add(ChangeView(
                                    exerciseView: ExerciseView.vdoExercise));
                              },
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                            child: ButtonBlueFade(
                          btnName: 'บันทึก',
                          onClick: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                (Route<dynamic> route) => false);
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
          )
        ],
      )),
    );
  }
}
