import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health_application/ui/base/model/master_data_detail.dart';
import 'package:health_application/ui/register_profile/model/sub_menu_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

class FoodFilterTypeWidget extends StatelessWidget {
  const FoodFilterTypeWidget(
      {this.values = const [],
      this.selectedFoodTypes = const [],
      this.onFoodTypeSelected});

  final List<MasterDataDetail> values;
  final List<SubMenuModel> selectedFoodTypes;
  final ValueChanged<SubMenuModel>? onFoodTypeSelected;

  @override
  Widget build(BuildContext context) {
    bool checkSelect(String code) {
      return selectedFoodTypes.any((element) => element.code == code);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: EdgeInsets.only(bottom: 25, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textBody1('ประเภทอาหาร', ColorTheme().black87),
                textBody2('เลือกประเภทอาหารที่ต้องการได้มากกว่า 1',
                    ColorTheme().black87, false),
                SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  children: values
                      .asMap()
                      .map((index, value) => MapEntry(
                          index,
                          GestureDetector(
                            onTap: () {
                              var item = SubMenuModel(
                                  code: value.keyCode, name: value.keyName);
                              onFoodTypeSelected?.call(item);
                            },
                            child: Chip(
                                backgroundColor: checkSelect(value.keyCode)
                                    ? ColorTheme().blueText
                                    : ColorTheme().GreyBorder,
                                label: textSubtitle2(
                                    value.keyName,
                                    checkSelect(value.keyCode)
                                        ? ColorTheme().white
                                        : ColorTheme().blueText,
                                    false)),
                          )))
                      .entries
                      .map((e) => e.value)
                      .toList(),
                )
              ],
            )),
        Container(height: 1, color: ColorTheme().GreyBorder)
      ],
    );
  }
}
