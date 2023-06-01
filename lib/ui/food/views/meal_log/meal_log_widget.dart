import 'package:flutter/material.dart';
import 'package:health_application/ui/extension/object_extension.dart';
import 'package:health_application/ui/food/model/food/meal.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class MealLogWidget extends StatelessWidget {
  const MealLogWidget({required this.meal, this.onAddButtonTapped});
  final Meal meal;
  final Function(MealType)? onAddButtonTapped;

  @override
  Widget build(BuildContext context) {
    final MealLogWidgetIconImageProvider? iconImageProvider = meal.mealType.optionalCast();
    final String iconImage = iconImageProvider?.iconImage ?? '';

    return Container(
      height: 88,
      margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
      padding: EdgeInsets.only(left: 30, right: 30),
      decoration: BoxDecoration(
        color: ColorTheme().greybackground5,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(iconImage, width: 50, height: 50),
          SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textSubtitle2(meal.mealType.name, ColorTheme().black87, false),
                textBody2("แคลอรี่ : " + meal.calories.toString(), ColorTheme().black87, false),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => {
              onAddButtonTapped?.call(meal.mealType)
            },
            child: Container(
              height: 15,
              width: 15,
              child: Image.asset('assets/images/add_icon.png'),
            ),
          )
        ],
      ),
    );
  }
}
