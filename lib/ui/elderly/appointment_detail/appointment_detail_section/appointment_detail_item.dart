import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

Widget AppointmentDetailItem({
  required String title, 
  required String description,
  required String image
}) => Container(
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(width: 12),
      Container(
        width: 18,
        height: 18,
        child: Image.asset(image, width: 18, height: 18, fit: BoxFit.contain),
      ),
      SizedBox(width: 20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textSubtitle2(title, ColorTheme().grey50, false),
            textSubtitle2(description, ColorTheme().black87, false)
          ],
        )
      )
    ],
  ),
);