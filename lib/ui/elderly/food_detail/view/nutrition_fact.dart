import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food_detail/view/collapsable_section.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class NutritionFact extends StatelessWidget {
  const NutritionFact({required this.food});

  final Food food;

  Widget separator(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(height: 1, color: ColorTheme().greybackground5),
        SizedBox(height: 16),
      ],
    );
  }

  @override 
  Widget build(BuildContext context) {

    return CollapsableSection(
      sectionHeaderTitle: 'คุณค่าทางโภชนาการ',
      iconImagePath: 'assets/images/nutrition_fact_icon.png',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W500('พลังงาน (kJ)', ColorTheme().black87),
              textSubtitle16W500('${food.energy.value} ${food.energy.unit.symbol}', ColorTheme().black87),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W500('แคลอรี่', ColorTheme().black87),
              textSubtitle16W500('${food.calories.value} ${food.calories.unit.symbol}', ColorTheme().black87),
            ],
          ),
          separator(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W500('ไขมัน', ColorTheme().black87),
              textSubtitle16W500('${food.nutritionFact.fat.value} ${food.nutritionFact.fat.unit.symbol}', ColorTheme().black87),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W200('ไขมันอิ่มตัว', ColorTheme().black87),
              textSubtitle16W200('${food.nutritionFact.saturatedFat.value} ${food.nutritionFact.saturatedFat.unit.symbol}', ColorTheme().black87),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W200('ไขมันไม่อิ่มตัว', ColorTheme().black87),
              textSubtitle16W200('${food.nutritionFact.unsaturatedFat.value} ${food.nutritionFact.unsaturatedFat.unit.symbol}', ColorTheme().black87),
            ],
          ),
          separator(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W500('คาร์บ', ColorTheme().black87),
              textSubtitle16W500('${food.nutritionFact.carbohydrate.value} ${food.nutritionFact.carbohydrate.unit.symbol}', ColorTheme().black87),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W200('ใยอาหาร', ColorTheme().black87),
              textSubtitle16W200('${food.nutritionFact.dietaryFiber.value} ${food.nutritionFact.dietaryFiber.unit.symbol}', ColorTheme().black87),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W200('น้ำตาล', ColorTheme().black87),
              textSubtitle16W200('${food.nutritionFact.sugar.value} ${food.nutritionFact.sugar.unit.symbol}', ColorTheme().black87),
            ],
          ),
          separator(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W500('โปรตีน', ColorTheme().black87),
              textSubtitle16W500('${food.nutritionFact.protein.value} ${food.nutritionFact.protein.unit.symbol}', ColorTheme().black87),
            ],
          ),
          separator(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W500('อื่นๆ', ColorTheme().black87),
              textSubtitle16W500('${food.nutritionFact.other.value} ${food.nutritionFact.other.unit.symbol}', ColorTheme().black87),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W200('โคเรสเตอรอล', ColorTheme().black87),
              textSubtitle16W200('${food.nutritionFact.cholesteral.value} ${food.nutritionFact.cholesteral.unit.symbol}', ColorTheme().black87),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W200('โคเรสเตโซเดียมอรอล', ColorTheme().black87),
              textSubtitle16W200('${food.nutritionFact.sodium.value} ${food.nutritionFact.sodium.unit.symbol}', ColorTheme().black87),
            ],
          ),
        ],
      ),
    );
  }
}