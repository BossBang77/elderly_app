import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/food/model/food/ingredient.dart';
import 'package:health_application/ui/elderly/food_detail/view/collapsable_section.dart';
import 'package:health_application/ui/elderly/food_detail/view/grid_view_layout.dart';
import 'package:health_application/ui/elderly/food_detail/view/ingredient_widget.dart';
import 'package:health_application/ui/elderly/food_detail/view/multichild_layout_delegate.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail_ingredient.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:collection/collection.dart';

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
    final gridViewLayout = GridViewLayout(
        context: context,
        dataSource: ingredients,
        spacing: 10,
        numberOfItemsPerRow: 3,
        padding: 32);

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
            SizedBox(height: 16),
            Container(
              height: gridViewLayout.gridViewHeight,
              child: CustomMultiChildLayout(
                delegate: GridMultiChildLayoutDelegate(layout: gridViewLayout),
                children: ingredients
                    .mapIndexed((index, ingredient) => LayoutId(
                        id: index,
                        child: IngredientWidget(
                          ingredient: ingredient,
                          width: gridViewLayout.gridItemWidth,
                          height: gridViewLayout.heightForItemAt(index),
                          numberOfPlates: numberOfPlates,
                        )))
                    .toList(),
              ),
            )
          ],
        ));
  }
}
