import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/elderly/food/views/nutrition_list/nutrition_widget.dart';

class NutritionListWidget extends StatelessWidget {
  const NutritionListWidget({this.nutrients = const []});

  final List<Nutrient> nutrients;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 18, right: 18),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
        itemBuilder: (BuildContext context, int index) => NutritionWidget(nutrient: nutrients[index]),
        itemCount: nutrients.length,
      ),
    );
  }
}
