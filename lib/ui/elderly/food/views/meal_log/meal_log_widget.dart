import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/food_log/model/response/summary_calorie.dart';
import 'package:health_application/ui/extension/object_extension.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../bloc/food_page/food_page_bloc.dart';

class MealLogWidget extends StatelessWidget {
  const MealLogWidget(
      {required this.meal,
      this.onAddButtonTapped,
      required this.summaryCalorie});
  final Meal meal;
  final Function(MealType)? onAddButtonTapped;
  final SummaryCalorie summaryCalorie;

  @override
  Widget build(BuildContext context) {
    final MealLogWidgetIconImageProvider? iconImageProvider =
        meal.mealType.optionalCast();
    final String iconImage = iconImageProvider?.iconImage ?? '';

    return Container(
      height: 88,
      margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
      padding: EdgeInsets.only(left: 30, right: 30),
      decoration: BoxDecoration(
          color: ColorTheme().greybackground5,
          borderRadius: BorderRadius.circular(12)),
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
                textBody2(
                    "แคลอรี่ : " +
                        getSummaryCalorie(summaryCalorie, meal.mealType.name) +
                        ' kcal',
                    ColorTheme().black87,
                    false),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => {onAddButtonTapped?.call(meal.mealType)},
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
