import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/food_detail/view/collapsable_section.dart';
import 'package:health_application/ui/elderly/food_detail/view/ingredient_widget.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail_ingredient.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList(
      {this.numberOfPlates = 1,
      this.ingredients = const [],
      this.onAddButtonTap,
      this.onMinusButtonTap});

  final int numberOfPlates;
  final List<FoodDetailIngredient> ingredients;
  final Function? onAddButtonTap;
  final Function? onMinusButtonTap;

  @override
  Widget build(BuildContext context) {
    return CollapsableSection(
        sectionHeaderTitle: 'วัตถุดิบ',
        iconImagePath: 'assets/images/material.png',
        child: Column(
          children: [
            Row(
              children: [
                textSubtitle2('สูตรสำหรับ ', ColorTheme().black87, false),
                Spacer(),
                SizedBox(
                    width: 25,
                    height: 25,
                    child: GestureDetector(
                      onTap: () {
                        onMinusButtonTap?.call();
                      },
                      child: Image.asset(numberOfPlates > 1
                          ? 'assets/images/ingredient_minus_icon_active.png'
                          : 'assets/images/ingredient_minus_icon.png'),
                    )),
                SizedBox(width: 12),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: ColorTheme().grey50),
                      borderRadius: BorderRadius.circular(12)),
                  child: textSubtitle2(
                      '${numberOfPlates} ที่', ColorTheme().black87, false),
                ),
                SizedBox(width: 12),
                SizedBox(
                    width: 25,
                    height: 25,
                    child: GestureDetector(
                      onTap: () {
                        onAddButtonTap?.call();
                      },
                      child:
                          Image.asset('assets/images/ingredient_add_icon.png'),
                    ))
              ],
            ),
            Container(
              child: GridView.count(
                padding: EdgeInsets.only(top: 20),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                mainAxisSpacing: 2,
                crossAxisSpacing: 1,
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                children: List.generate(ingredients.length, (index) {
                  return IngredientWidget(
                    ingredient: ingredients[index],
                    numberOfPlates: numberOfPlates,
                  );
                }),
              ),
            )
          ],
        ));
  }
}
