import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class VolunteerMenu extends StatelessWidget {
  const VolunteerMenu(
      {required this.title, required this.image, required this.width});
  final String title;
  final String image;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4), color: ColorTheme().grey10, blurRadius: 5)
          ],
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      height: 96,
      child: Row(
        children: [
          Container(
              width: width / 2.6,
              child: Center(
                  child: textSubtitle2(title, ColorTheme().black87, false))),
        ],
      ),
    );
  }
}
