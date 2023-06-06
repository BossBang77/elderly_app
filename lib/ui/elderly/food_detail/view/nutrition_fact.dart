import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food_detail/model/food_nutrition_fact.dart';
import 'package:health_application/ui/elderly/food_detail/view/collapsable_section.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class NutritionFact extends StatelessWidget {
  const NutritionFact({required this.food});

  final FoodNutritionFact food;

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
              textSubtitle16W500('${food.calorie.value} ${food.calorie.unit.symbol}', ColorTheme().black87),
            ],
          ),
          separator(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W500('ไขมัน', ColorTheme().black87),
              textSubtitle16W500('${food.fat.value} ${food.fat.unit.symbol}', ColorTheme().black87),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W200('ไขมันอิ่มตัว', ColorTheme().black87),
              textSubtitle16W200('${food.saturatedFat.value} ${food.saturatedFat.unit.symbol}', ColorTheme().black87),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W200('ไขมันไม่อิ่มตัว', ColorTheme().black87),
              textSubtitle16W200('${food.unsaturatedFat.value} ${food.unsaturatedFat.unit.symbol}', ColorTheme().black87),
            ],
          ),
          separator(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W500('คาร์บ', ColorTheme().black87),
              textSubtitle16W500('${food.carbohydrate.value} ${food.carbohydrate.unit.symbol}', ColorTheme().black87),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W200('ใยอาหาร', ColorTheme().black87),
              textSubtitle16W200('${food.fiber.value} ${food.fiber.unit.symbol}', ColorTheme().black87),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W200('น้ำตาล', ColorTheme().black87),
              textSubtitle16W200('${food.sugar.value} ${food.sugar.unit.symbol}', ColorTheme().black87),
            ],
          ),
          separator(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W500('โปรตีน', ColorTheme().black87),
              textSubtitle16W500('${food.protein.value} ${food.protein.unit.symbol}', ColorTheme().black87),
            ],
          ),
          separator(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W500('อื่นๆ', ColorTheme().black87),
              textSubtitle16W500('${food.other.value} ${food.other.unit.symbol}', ColorTheme().black87),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W200('โคเรสเตอรอล', ColorTheme().black87),
              textSubtitle16W200('${food.cholesterol.value} ${food.cholesterol.unit.symbol}', ColorTheme().black87),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textSubtitle16W200('โคเรสเตโซเดียมอรอล', ColorTheme().black87),
              textSubtitle16W200('${food.sodium.value} ${food.sodium.unit.symbol}', ColorTheme().black87),
            ],
          ),
        ],
      ),
    );
  }
}