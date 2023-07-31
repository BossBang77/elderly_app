import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../base/widget/text_field_widget.dart';

class FoodFilterCaloriesWidget extends StatelessWidget {
  const FoodFilterCaloriesWidget(
      {this.onMinimumValueChange,
      this.onMaximumValueChange,
      required this.maxVal,
      required this.minVal});
  final Function(String)? onMinimumValueChange;
  final Function(String)? onMaximumValueChange;
  final String maxVal;
  final String minVal;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(bottom: 25, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textBody1('แคลอรี่', ColorTheme().black87),
                textBody2('ระบุแคลอรี่ที่ต้องการรับประทานต่อมื้อ',
                    ColorTheme().black87, false),
                SizedBox(height: 16),

                /// Min
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        child: TextFieldWidget.enable(
                      suffix: true,
                      suffixTxt: 'kcal',
                      text: minVal,
                      textNumberType: true,
                      maxLength: 100,
                      onChanged: (value) {
                        onMinimumValueChange?.call(value);
                      },
                      onFieldSubmitted: () {},
                    )),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: textSubtitle16Blod('-', color.black87),
                    ),
                    //Max
                    Flexible(
                        child: TextFieldWidget.enable(
                      suffix: true,
                      suffixTxt: 'kcal',
                      text: maxVal,
                      textNumberType: true,
                      maxLength: 100,
                      onChanged: (value) {
                        onMaximumValueChange?.call(value);
                      },
                      onFieldSubmitted: () {},
                    )),
                  ],
                ),
              ],
            )),
        Container(height: 1, color: ColorTheme().GreyBorder)
      ],
    );
  }
}
