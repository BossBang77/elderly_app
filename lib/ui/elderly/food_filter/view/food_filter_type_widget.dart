import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class FoodFilterTypeWidget<ItemType> extends StatelessWidget {
  const FoodFilterTypeWidget({
    this.items = const[], 
    this.values = const[],
    this.selectedFoodTypes = const[],
    this.onFoodTypeSelected
  });
  final List<ItemType> items;
  final List<String> values;
  final List<String> selectedFoodTypes;
  final Function(ItemType)? onFoodTypeSelected;

  @override 
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 25, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textBody1('ประเภทอาหาร', ColorTheme().black87),
              textBody2('เลือกประเภทอาหารที่ต้องการได้มากกว่า 1', ColorTheme().black87, false),
              SizedBox(height: 16),
              Wrap(
                spacing: 8,
                children: values.asMap().map((index, value) => 
                  MapEntry(
                    index, 
                    GestureDetector(
                      onTap: () {
                        onFoodTypeSelected?.call(items[index]);
                      },
                      child: Chip(
                        backgroundColor: selectedFoodTypes.contains(value) ? ColorTheme().blueText : ColorTheme().GreyBorder,
                        label:  textSubtitle2(value, selectedFoodTypes.contains(value) ? ColorTheme().white : ColorTheme().blueText, false)),
                    )
                  )
                ).entries.map((e) => e.value).toList(),
              )
            ],
          )
        ),
        
        Container(height: 1, color: ColorTheme().GreyBorder)
      ],
    );
  } 
}