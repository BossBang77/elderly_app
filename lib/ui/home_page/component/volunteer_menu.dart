import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class VolunteerMenu extends StatelessWidget {
  const VolunteerMenu({required this.title , required this.image});
  final String title;
  final String image;

  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(offset: Offset(0, 4), color: ColorTheme().grey10, blurRadius: 5)],
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        )
      ),
      height: 96,
      child: Row(
        children: [
          Expanded(
            child: textSubtitle2(title, ColorTheme().black87, false),
          ),
          Expanded(child: Container(),)
        ],
      )
    );
  }
}