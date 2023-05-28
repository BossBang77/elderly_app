import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

Widget menuItem(BuildContext context,
    {required bool isSelect,
    required String imgIsSelect,
    required String imgUnSelect,
    required String title,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          isSelect ? imgIsSelect : imgUnSelect,
          scale: 3,
        ),
        text12Bold(
          title,
          isSelect ? ColorTheme().BlueDark2 : Colors.grey,
        ),
      ],
    ),
  );
}
