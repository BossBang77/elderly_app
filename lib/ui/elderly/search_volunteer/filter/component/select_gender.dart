import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

Widget selectGender(BuildContext context,
    {required bool active,
    required String imgActive,
    required String imgInactive,
    required String title,
    required VoidCallback onClick}) {
  return Flexible(
    child: InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border:
                Border.all(color: active ? color.DartBlue : color.GreyBorder),
            color: active ? color.DartBlue : color.grey10,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              active ? imgActive : imgInactive,
              scale: 4,
            ),
            const SizedBox(
              width: 20,
            ),
            textSubtitle1(title, active ? color.white : color.black87),
          ],
        ),
      ),
    ),
  );
}
