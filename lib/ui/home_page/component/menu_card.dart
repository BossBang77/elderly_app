import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

Widget menuCard(BuildContext context,
    {required VoidCallback onClick,
    required String background,
    required String icon,
    required String title,
    required String subTitle}) {
  return InkWell(
    onTap: () {
      onClick();
    },
    child: Stack(
      children: [
        Image.asset(
          background,
          scale: 3,
        ),
        Positioned(
          left: 15,
          top: 15,
          child: Image.asset(
            icon,
            scale: 4,
          ),
        ),
        Positioned(
            left: 15,
            top: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textSubtitle18Blod(title, ColorTheme().white),
                textButton1(subTitle, ColorTheme().white, maxLines: 2)
              ],
            ))
      ],
    ),
  );
}
