import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail_ingredient.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget(
      {required this.ingredient,
      required this.height,
      required this.width,
      required this.numberOfPlates});
  final FoodDetailIngredient ingredient;
  final double height;
  final double width;
  final int numberOfPlates;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width - 10,
              height: width - 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width - 10),
                  image: DecorationImage(
                      image: NetworkImage(
                        ingredient.image,
                      ),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 10),
            textSubtitle2(ingredient.name, ColorTheme().black87, true),
            textSubtitle2(
                '${ingredient.unit * numberOfPlates} ${ingredient.unitName}',
                ColorTheme().black87,
                true)
          ],
        ));
  }
}
