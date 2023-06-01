import 'package:health_application/ui/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/food/model/nutritions/nutrient_widget_background_provider.dart';

class Fat implements Nutrient, NutrientWidgetImageProvider {
  @override
  String get name => "Fat";

  @override
  final double value;

  @override
  final String iconImage = "assets/images/fat_icon.png";

  @override
  final String backgroundImage = "assets/images/fat_bg.png";

  @override
  final NutrientUnit unit = UnitEnergy.kilocalories;

  const Fat({required this.value});
}
