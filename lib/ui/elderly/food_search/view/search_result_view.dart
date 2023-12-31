import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/image_notfound.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

enum FoodListItemViewTrailingIcon {
  next(trailingIconPath: 'assets/images/arrow.png'),
  close(trailingIconPath: 'assets/images/close_icon.png');

  const FoodListItemViewTrailingIcon({required this.trailingIconPath});
  final String trailingIconPath;
}

class FoodListItemView extends StatelessWidget {
  const FoodListItemView(
      {required this.image,
      required this.name,
      required this.calories,
      this.onTap,
      this.onTrailingIconTap,
      this.trailingIcon = FoodListItemViewTrailingIcon.next});

  final Function()? onTap;
  final Function()? onTrailingIconTap;
  final String image;
  final String name;
  final Nutrient calories;
  final FoodListItemViewTrailingIcon trailingIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap?.call();
        },
        child: Container(
          height: 88,
          margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              image.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        image,
                        width: 75,
                        height: 75,
                        fit: BoxFit.cover,
                      ))
                  : ImageNotFound(),
              SizedBox(width: 25),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textSubtitle2(name, ColorTheme().black87, false),
                    textBody2(
                        calories.value.toString() + ' ' + calories.unit.symbol,
                        ColorTheme().black87,
                        false),
                  ],
                ),
              ),
              SizedBox(width: 25),
              SizedBox(
                  height: 20,
                  width: 20,
                  child: GestureDetector(
                    onTap: () {
                      onTrailingIconTap?.call();
                    },
                    child: Image.asset(trailingIcon.trailingIconPath),
                  )),
            ],
          ),
        ));
  }
}
