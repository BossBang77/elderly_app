import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/food/model/food/ingredient.dart';
import 'package:health_application/ui/elderly/food_detail/view/collapsable_section.dart';
import 'package:health_application/ui/elderly/food_detail/view/ingredient_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    this.numberOfPlates = 1, 
    this.ingredients = const[],
    this.onAddButtonTap,
    this.onMinusButtonTap
  });

  final int numberOfPlates;
  final List<Ingredient> ingredients;
  final Function? onAddButtonTap;
  final Function? onMinusButtonTap;

  @override 
  Widget build(BuildContext context) {
    return CollapsableSection(
      sectionHeaderTitle: 'วัตถุดิบ',
      iconImagePath: 'assets/images/nutrition_fact_icon.png',
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
                  child: Image.asset('assets/images/ingredient_minus_icon.png'),
                )
              ),      
              SizedBox(width: 12),        
              Container(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: ColorTheme().grey50),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: textSubtitle2('${numberOfPlates} ที่', ColorTheme().black87, false),
              ),
              SizedBox(width: 12),
              SizedBox(
                width: 25,
                height: 25,
                child: GestureDetector(
                  onTap: () {
                    onAddButtonTap?.call();
                  },
                  child: Image.asset('assets/images/ingredient_add_icon.png'),
                )
              )
            ],
          ),
          Container(
            height: (((ingredients.length - 1) / 3).floor() + 1) * 110,
            child: GridView.count(
              crossAxisCount: 3,
              children: ingredients.map((ingredient) => IngredientWidget(name: ingredient.name, imagePath: ingredient.image)).toList(),
            )
          )
        ],
      )
    );
  }
}