import 'package:json_annotation/json_annotation.dart';

part 'nutrition_fact_summary.g.dart';

@JsonSerializable()
class NutritionFactSummary {
  const NutritionFactSummary({
    this.calorie = 0,
    this.fat = 0,
    this.protein = 0,
    this.carbohydrate = 0,
    this.sugar = 0,
    this.cholesterol = 0
  });
  final double calorie;
  final double fat;
  final double protein;
  final double carbohydrate;
  final double sugar;
  final double cholesterol;

  factory NutritionFactSummary.fromJson(Map<String, dynamic> json) =>
      _$NutritionFactSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$NutritionFactSummaryToJson(this);

  List<Object?> get props => <Object>[
    calorie,
    fat,
    protein,
    carbohydrate,
    sugar,
    cholesterol
  ];
}