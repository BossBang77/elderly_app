import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

enum FoodListItemViewTrailingIcon {
  next(trailingIconPath: 'assets/images/arrow.png'),
  close(trailingIconPath: 'assets/images/close_icon.png');

  const FoodListItemViewTrailingIcon({required this.trailingIconPath});
  final String trailingIconPath;
}

class FoodListItemView extends StatelessWidget {
  const FoodListItemView({
    required this.food, 
    this.onTap, 
    this.onTrailingIconTap,
    this.trailingIcon = FoodListItemViewTrailingIcon.next
  });

  final Function(Food)? onTap;
  final Function(Food)? onTrailingIconTap;
  final Food food;
  final FoodListItemViewTrailingIcon trailingIcon;

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onTap?.call(food);
      },
      child: Container(
        height: 88,
        margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
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
              child: GestureDetector(
                onTap: () {
                  onTrailingIconTap?.call(food);
                },
                child: Image.asset(trailingIcon.trailingIconPath),
              )
            ),
          ],
        ),
      )
    );
  }
}