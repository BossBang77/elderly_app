import 'package:flutter/foundation.dart';
import 'package:health_application/ui/elderly/food/model/food/food_category.dart';
import 'package:health_application/ui/elderly/food/model/food/food_method.dart';
import 'package:health_application/ui/elderly/food/model/food/ingredient.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';

class Food {
  final String name;
  final List<FoodCategory> categories;
  final List<Nutrient> nutrients;
  final Nutrient calories;
  final String durationMin;
  final String durationMax;
  final String description;
  final List<Ingredient> ingredients;
  final List<FoodMethod> methods;
  final String image;

  Food(
      {required this.name,
      this.categories = const [],
      this.nutrients = const [],
      required this.calories, 
      this.durationMin = '',
      this.durationMax = '',
      this.description = '',
      this.ingredients = const [],
      this.methods = const [],
      this.image = ''});
}
