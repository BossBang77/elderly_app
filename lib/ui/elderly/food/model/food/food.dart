import 'package:flutter/foundation.dart';
import 'package:health_application/ui/elderly/food/model/food/food_category.dart';
import 'package:health_application/ui/elderly/food/model/food/food_method.dart';
import 'package:health_application/ui/elderly/food/model/food/ingredient.dart';
import 'package:health_application/ui/elderly/food/model/food/nutrition_fact.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/elderly/food_log_detail/model/food_log_detail_representable.dart';

class Food implements FoodLogDetailRepresentable {
  final String code;
  final String name;
  final int unit;
  final List<FoodCategory> categories;
  final NutritionFact nutritionFact;
  final Nutrient calories;
  final Nutrient energy;
  final String durationMin;
  final String durationMax;
  final String description;
  final List<Ingredient> ingredients;
  final List<FoodMethod> methods;
  final String image;

  Food({
    required this.code,
    required this.name,
    this.unit = 0,
    this.categories = const [],
    this.nutritionFact = const NutritionFact.zero(),
    required this.calories, 
    required this.energy,
    this.durationMin = '',
    this.durationMax = '',
    this.description = '',
    this.ingredients = const [],
    this.methods = const [],
    this.image = '',
    this.consumedUnit = 0,
  });
      
  @override
  double get consumedCalories => consumedUnit * calories.value;

  @override
  int consumedUnit = 0;

  Food copyWith({
    String? code,
    String? name,
    int? unit,
    List<FoodCategory>? categories,
    NutritionFact? nutritionFact,
    Nutrient? calories,
    Nutrient? energy,
    String? durationMin,
    String? durationMax,
    String? description,
    List<Ingredient>? ingredients,
    List<FoodMethod>? methods,
    String? image,
    int? consumedUnit,
  }) {
    return Food(
      code: code ?? this.code,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      categories: categories ?? this.categories,
      nutritionFact: nutritionFact ?? this.nutritionFact,
      calories: calories ?? this.calories,
      energy: energy ?? this.energy,
      durationMin: durationMin ?? this.durationMin,
      durationMax: durationMax ?? this.durationMax,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      methods: methods ?? this.methods,
      image: image ?? this.image,
      consumedUnit: consumedUnit ?? this.consumedUnit,
    );
  }
}