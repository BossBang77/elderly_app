class FoodLogDetailModel {
  const FoodLogDetailModel({
    required this.code,
    required this.name,
    required this.unit,
    required this.calorie
  });
  final String code;
  final String name;
  final int unit;
  final double calorie;
}