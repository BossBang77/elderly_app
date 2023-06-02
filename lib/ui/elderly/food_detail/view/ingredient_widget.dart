import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({required this.name , required this.imagePath});
  final String name;
  final String imagePath;

  @override 
  Widget build(BuildContext context) {
    return Container(
      height: 103,
      width: 70,
      child: Column(
        children: [
          //TODO image from api
          SizedBox(
            width: 48,
            height: 48,
            child: Image.asset(''),
          ),
          textSubtitle1('text', ColorTheme().black87)
        ],
      )
    );
  }
}