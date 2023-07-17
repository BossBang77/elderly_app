import 'package:flutter/material.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../elderly/health_profile/bloc/health_profile_bloc.dart';

Widget SummaryBMIWidget(BuildContext context, RegisterProfileState state) {
  String checkBMI(double bmiValue) {
    double value = bmiValue;
    if (value < 18.5) {
      // ต่ำกว่าเกณฑ์
      return 'assets/images/bmi_low.png';
    } else if (value > 24.9) {
      // สูงกว่าเกณฑ์
      return 'assets/images/bmi_height.png';
    } else {
      //ปกติ
      return 'assets/images/bmi_medium.png';
    }
  }

  return SingleChildScrollView(
    child: Column(
      children: [
        Center(
            child: textSubtitle24('ดัชนีมวลกายของคุณ', ColorTheme().black87)),
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          checkBMI(state.bmiValue),
          scale: 5,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
            child: textSubtitle24(
                state.bmiValue.toStringAsFixed(1), ColorTheme().Primary)),
        textSubtitle18Blod(
            'น้ำหนัก${getBMITitle(state.bmiValue)}', ColorTheme().black87),
        const SizedBox(
          height: 20,
        ),
        textSubtitle2('น้ำหนักที่มาตราฐานตามเกณฑ์ คือ\nระหว่าง 18.5 – 24.9 ',
            ColorTheme().black87, true,
            maxLine: 3),
        const SizedBox(
          height: 20,
        ),
        textSubtitle2(
            'คำแนะนำ : \nควรกินอาหารให้ครบ 5 หมู่ \nในสัดส่วนที่เหมาะสม เเละออกกำลังกาย \nเพื่อสุขภาพที่ดี',
            ColorTheme().black87,
            true,
            maxLine: 4)
      ],
    ),
  );
}
