import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class SearchResultItemView extends StatelessWidget {
  const SearchResultItemView({required this.food, this.onTap});

  final Function? onTap;
  final Food food;

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 88,
        margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(food.image.isEmpty ? food.image : '', width: 50, height: 50),
            ),
            SizedBox(width: 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textSubtitle2(food.name, ColorTheme().black87, false),
                  textBody2(food.calories.value.toString() + ' ' + food.calories.unit.symbol, ColorTheme().black87, false),
                ],
              ),
            ),
            SizedBox(width: 25),
            SizedBox(
              height: 20,
              width: 20,
              child: Image.asset('assets/images/arrow.png'),
            ),
          ],
        ),
      )
    );
  }
}