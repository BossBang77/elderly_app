import 'package:json_annotation/json_annotation.dart';

part 'food_detail_nutrition.g.dart';

@JsonSerializable()
class FoodDetailNutrition {
  const FoodDetailNutrition({
    this.energy = 0,
    this.calorie = 0,
    this.fat = 0,
    this.unsaturatedFat = 0,
    this.saturatedFat = 0,
    this.fiber = 0,
    this.protein = 0,
    this.carbohydrate = 0,
    this.sugar = 0,
    this.cholesterol = 0,
    this.other = 0,
    this.sodium = 0
  });
  final double energy;
  final double calorie;
  final double fat;
  final double saturatedFat;
  final double unsaturatedFat;
  final double fiber;
  final double protein;
  final double carbohydrate;
  final double sugar;
  final double cholesterol;
  final double other;
  final double sodium;

  List<Object?> get props => <Object>[
    energy,
    calorie,
    fat,
    unsaturatedFat,
    saturatedFat,
    fiber,
    protein,
    carbohydrate,
    sugar,
    cholesterol,
    other,
    sodium
  ];

  factory FoodDetailNutrition.fromJson(Map<String, dynamic> json) =>
      _$FoodDetailNutritionFromJson(json);
  Map<String, dynamic> toJson() => _$FoodDetailNutritionToJson(this);

  
}