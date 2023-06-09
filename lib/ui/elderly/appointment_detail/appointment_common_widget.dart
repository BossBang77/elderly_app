import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

Widget separator() => SizedBox(height: 8);

Widget topSpace() => Container(
  height: 50,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
    color: ColorTheme().white
  ),
);
