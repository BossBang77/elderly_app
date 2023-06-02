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

class ExerciseCalculate extends StatelessWidget {
  const ExerciseCalculate({super.key, required this.timeExercise});
  final String timeExercise;
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              height: sized.height * 0.6,
              width: sized.width,
              decoration: BoxDecoration(
                  color: color.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/icon_exercise_calculate.png',
                      scale: 4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textH7('สำเร็จ!', Colors.grey),
                    textSubtitle24W700(
                        'คุณเผาผลาญแคลอรี่ได้', ColorTheme().black87),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textH7('ระยะเวลา ', color.black87),
                        textSubtitle18Blod(
                            '$timeExercise นาที', ColorTheme().black87),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: sized.width,
                      padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
                      decoration: BoxDecoration(
                          color: color.grey10,
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.4), width: 0.7),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          textH6('แคลอรี่ (kcal)', color.black87, true),
                          textH4('649', color.Primary),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ButtonGradient(
                      btnName: 'บันทึกรายการ',
                      onClick: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false);
                      },
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
