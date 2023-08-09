import 'package:health_application/ui/elderly/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/food_nutrient.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail_nutrition.dart';

class FoodNutritionFact {
  const FoodNutritionFact(
      {required this.energy,
      required this.calorie,
      required this.fat,
      required this.unsaturatedFat,
      required this.saturatedFat,
      required this.fiber,
      required this.protein,
      required this.carbohydrate,
      required this.sugar,
      required this.cholesterol,
      required this.other,
      required this.sodium});
  final Nutrient energy;
  final Nutrient calorie;
  final Nutrient fat;
  final Nutrient saturatedFat;
  final Nutrient unsaturatedFat;
  final Nutrient fiber;
  final Nutrient protein;
  final Nutrient carbohydrate;
  final Nutrient sugar;
  final Nutrient cholesterol;
  final Nutrient other;
  final Nutrient sodium;

  factory FoodNutritionFact.fromResponse(FoodDetailNutrition response) {
    return FoodNutritionFact(
        energy: FoodNutrient(
            name: 'eneregy',
            value: response.energy,
            unit: UnitEnergy.kilojoules),
        calorie: FoodNutrient(
            name: 'calorie',
            value: response.calorie,
            unit: UnitEnergy.kilocalories),
        fat:
            FoodNutrient(name: 'fat', value: response.fat, unit: UnitMass.gram),
        unsaturatedFat: FoodNutrient(
            name: 'unsaturatedFat',
            value: response.unsaturatedFat,
            unit: UnitMass.gram),
        saturatedFat: FoodNutrient(
            name: 'saturatedFat',
            value: response.saturatedFat,
            unit: UnitMass.gram),
        fiber: FoodNutrient(
            name: 'fiber', value: response.fiber, unit: UnitMass.gram),
        protein: FoodNutrient(
            name: 'protein', value: response.protein, unit: UnitMass.gram),
        carbohydrate: FoodNutrient(
            name: 'carbohydrate',
            value: response.carbohydrate,
            unit: UnitMass.gram),
        sugar: FoodNutrient(
            name: 'sugar', value: response.sugar, unit: UnitMass.gram),
        cholesterol: FoodNutrient(
            name: 'cholesterol',
            value: response.cholesterol,
            unit: UnitMass.milligram),
        other: FoodNutrient(
            name: 'other', value: response.other, unit: UnitMass.gram),
        sodium: FoodNutrient(
            name: 'sodium', value: response.sodium, unit: UnitMass.milligram));
  }
}
