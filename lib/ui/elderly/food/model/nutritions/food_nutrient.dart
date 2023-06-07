import 'package:health_application/ui/elderly/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';

class FoodNutrient implements Nutrient {
  @override
  final String name;

  @override
  final double value;

  @override
  final NutrientUnit unit;

  const FoodNutrient({required this.name, required this.value, required this.unit});

  const FoodNutrient.empty({this.name = '', this.value = 0, this.unit = UnitMass.gram});
}
