import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ui-extensions/color.dart';
import '../../ui-extensions/font.dart';

Widget somethingWrong() {
  return Container(
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100.h,
        ),
        Image.asset(
          'assets/images/Icon_expiredtoken.png',
          scale: 6,
        ),
        const SizedBox(
          height: 20,
        ),
        textOverline2("เกิดข้อผิดพลาดในการค้นหา \n ลองใหม่อีกครั้ง",
            ColorTheme().OnBackground2),
      ],
    ),
  );
}

Widget dataNotFound() {
  return Container(
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100.h,
        ),
        Image.asset(
          'assets/images/Icon_expiredtoken.png',
          scale: 6,
        ),
        const SizedBox(
          height: 20,
        ),
        textOverline2("ไม่พบข้อมูลอุบัติเหตุ", ColorTheme().OnBackground2),
      ],
    ),
  );
}
