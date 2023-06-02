
import 'package:health_application/ui/elderly/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient_widget_background_provider.dart';

class Cholesterol implements Nutrient, NutrientWidgetImageProvider {
  @override
  String get name => "Cholesterol";

  @override
  final double value;

  @override
  final String iconImage = "assets/images/cholesteral_icon.png";

  @override
  final String backgroundImage = "assets/images/cholesterol_bg.png";

  @override
  final NutrientUnit unit = UnitEnergy.kilocalories;

  const Cholesterol({required this.value});
}