import 'package:health_application/ui/food/model/nutrition_unit/nutrient_unit.dart';

abstract class Nutrient {
  final String name;
  final double value;
  final NutrientUnit unit;

  Nutrient(this.name, this.value, this.unit);
}
