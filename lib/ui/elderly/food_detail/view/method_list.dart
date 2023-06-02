import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/food/model/food/food_method.dart';
import 'package:health_application/ui/elderly/food_detail/view/collapsable_section.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class MethodList extends StatelessWidget {
  const MethodList({required this.methods});
  final List<FoodMethod> methods;

  @override 
  Widget build(BuildContext context) {
    return CollapsableSection(
      sectionHeaderTitle: 'วิธีทำ',
      iconImagePath: 'assets/images/nutrition_fact_icon.png',
      child: Column(
        children: methods.map((method) => 
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Image.network(''),
                ),
                SizedBox(height: 16),
                textSubtitle1('text', ColorTheme().black87),
                SizedBox(height: 16),
                textBody2('text', ColorTheme().black87, false)
              ],
            ),
          ),
        ).toList()
      )
    );
  }
}