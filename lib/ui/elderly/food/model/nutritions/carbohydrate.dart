import 'package:health_application/ui/elderly/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient_widget_background_provider.dart';

class Carbohydrate implements Nutrient, NutrientWidgetImageProvider {
  @override
  String get name => "Carbohydrate";

  @override
  final double value;

  @override
  final String iconImage = "assets/images/carbohydrate_icon.png";

  @override
  final String backgroundImage = "assets/images/carbs_bg.png";

  @override
  final NutrientUnit unit = UnitMass.gram;

  const Carbohydrate({required this.value});
}