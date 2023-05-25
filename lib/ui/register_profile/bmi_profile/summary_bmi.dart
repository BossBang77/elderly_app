import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

Widget SummaryBMIWidget(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Center(
            child: textSubtitle24('ดัชนีมวลกายของคุณ', ColorTheme().black87)),
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          'assets/images/bmi_height.png',
          scale: 5,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(child: textSubtitle24('31.0', ColorTheme().Primary)),
        textSubtitle18Blod('น้ำหนักตรงตามเกณฑ์', ColorTheme().black87),
        const SizedBox(
          height: 20,
        ),
        textSubtitle2('น้ำหนักที่มาตราฐานตามเกณฑ์ คือ\nระหว่าง 18.5 – 24.9 ',
            ColorTheme().black87, true),
        const SizedBox(
          height: 20,
        ),
        textSubtitle2(
            'คำแนะนำ : \nควรกินอาหารให้ครบ 5 หมู่ \nในสัดส่วนที่เหมาะสม เเละออกกำลังกาย \nเพื่อสุขภาพที่ดี',
            ColorTheme().black87,
            true)
      ],
    ),
  );
}
