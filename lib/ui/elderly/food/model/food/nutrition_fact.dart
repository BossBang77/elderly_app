import 'package:health_application/ui/elderly/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/food_nutrient.dart';

class NutritionFact {
  const NutritionFact({
    required this.energy,
    required this.calories,
    required this.fat,
    required this.unsaturatedFat,
    required this.saturatedFat,
    required this.carbohydrate,
    required this.dietaryFiber,
    required this.sugar,
    required this.protein,
    required this.other,
    required this.cholesteral,
    required this.sodium
  });

  final FoodNutrient energy;
  final FoodNutrient calories;
  final FoodNutrient fat;
  final FoodNutrient unsaturatedFat;
  final FoodNutrient saturatedFat;
  final FoodNutrient carbohydrate;
  final FoodNutrient dietaryFiber;
  final FoodNutrient sugar;
  final FoodNutrient protein;
  final FoodNutrient other;
  final FoodNutrient cholesteral;
  final FoodNutrient sodium;

  const NutritionFact.zero({
    this.energy = const FoodNutrient(name: 'พลังงาน (kJ)', value: 0, unit: UnitEnergy.kilojoules), 
    this.calories = const FoodNutrient(name: 'แคลอรี่', value: 0, unit: UnitEnergy.kilocalories),
    this.fat = const FoodNutrient(name: 'ไขมัน', value: 0, unit: UnitMass.gram), 
    this.unsaturatedFat = const FoodNutrient(name: 'ไขมันอิ่มตัว', value: 0, unit: UnitMass.gram), 
    this.saturatedFat = const FoodNutrient(name: 'ไขมันไม่อิ่มตัว', value: 0, unit: UnitMass.gram), 
    this.carbohydrate = const FoodNutrient(name: 'คาร์บ', value: 0, unit: UnitMass.gram), 
    this.dietaryFiber = const FoodNutrient(name: 'ใยอาหาร', value: 0, unit: UnitMass.gram), 
    this.sugar = const FoodNutrient(name: 'น้ำตาล', value: 0, unit: UnitMass.gram), 
    this.protein = const FoodNutrient(name: 'โปรตีน', value: 0, unit: UnitMass.gram), 
    this.other = const FoodNutrient(name: 'อื่นๆ', value: 0, unit: UnitMass.gram), 
    this.cholesteral = const FoodNutrient(name: 'โคเรสเตอรอล', value: 0, unit: UnitMass.milligram), 
    this.sodium = const FoodNutrient(name: 'โซเดียม', value: 0, unit: UnitMass.milligram)
  });
}