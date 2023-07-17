import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:health_application/ui/elderly/food/model/food/food_method.dart';
import 'package:health_application/ui/elderly/food_detail/view/collapsable_section.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail_cooking_method.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class MethodList extends StatelessWidget {
  const MethodList({required this.methods});
  final List<FoodDetailCookingMethod> methods;

  @override
  Widget build(BuildContext context) {
    return CollapsableSection(
        sectionHeaderTitle: 'วิธีทำ',
        iconImagePath: 'assets/images/solution_food.png',
        child: Column(
            children: methods
                .map(
                  (method) => Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              method.image,
                              width: 75,
                              height: 140,
                              fit: BoxFit.cover,
                            )),
                        SizedBox(height: 16),
                        textSubtitle1(
                          "ขั้นตอนที่ " + method.order.toString(),
                          ColorTheme().black87,
                        ),
                        SizedBox(height: 5),
                        textBody2(
                            method.description, ColorTheme().black87, false,
                            maxLine: 10)
                      ],
                    ),
                  ),
                )
                .toList()));
  }
}
