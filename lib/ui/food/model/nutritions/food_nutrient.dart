import 'package:health_application/ui/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/food/model/nutritions/nutrient.dart';

class FoodNutrient implements Nutrient {
  @override
  final String name;

  @override
  final double value;

  @override
  final NutrientUnit unit;

  const FoodNutrient({required this.name, required this.value, required this.unit});
}
