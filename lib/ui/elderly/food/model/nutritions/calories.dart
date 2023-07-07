import 'package:health_application/ui/elderly/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient_widget_background_provider.dart';

class Calories implements Nutrient, NutrientWidgetImageProvider {
  @override
  String get name => "แคลอรี่";

  @override
  final double value;

  @override
  final String iconImage = "assets/images/calories_icon.png";

  @override
  final String backgroundImage = "assets/images/calories_bg.png";

  @override
  final NutrientUnit unit = UnitEnergy.kilocalories;

  const Calories({required this.value});
}
