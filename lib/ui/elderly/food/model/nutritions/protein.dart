import 'package:health_application/ui/elderly/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient_widget_background_provider.dart';

class Protein implements Nutrient, NutrientWidgetImageProvider {
  @override
  String get name => "Protein";

  @override
  final double value;

  @override
  final String iconImage = "assets/images/protein_icon.png";

  @override
  final String backgroundImage = "assets/images/protein_bg.png";

  @override
  final NutrientUnit unit = UnitMass.gram;

  const Protein({required this.value});
}
