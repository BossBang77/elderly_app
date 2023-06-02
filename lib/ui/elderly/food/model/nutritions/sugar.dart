import 'package:health_application/ui/elderly/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient_widget_background_provider.dart';

class Sugar implements Nutrient, NutrientWidgetImageProvider {
  @override
  String get name => "Sugar";

  @override
  final double value;

  @override
  final String iconImage = "assets/images/sugar_icon.png";

  @override
  final String backgroundImage = "assets/images/sugar_bg.png";

  @override
  final NutrientUnit unit = UnitMass.gram;

  const Sugar({required this.value});
}
