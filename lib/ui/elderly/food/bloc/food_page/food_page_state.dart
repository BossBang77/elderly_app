import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/calories.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/carbohydrate.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/cholesterol.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/fat.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/protein.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/sugar.dart';

class FoodPageState extends Equatable {
  FoodPageState({
    this.meals = const [
      Meal(mealType: MealType.breakfast),
      Meal(mealType: MealType.lunch),
      Meal(mealType: MealType.snack),
      Meal(mealType: MealType.dinner),
    ]
  });

  final List<Nutrient> nutrients = [
    Calories(value: 0),
    Fat(value: 0),
    Protein(value: 0),
    Carbohydrate(value: 0),
    Sugar(value: 0),
    Cholesterol(value: 0)
  ];

  final List<Meal> meals;

  @override
  List<Object> get props => [meals, nutrients];

  @override 
  bool? get stringify => true;

  FoodPageState copyWith({
    List<Nutrient>? nutrients,
    List<Meal>? meals
  }) {
    print('${meals?.first.calories} ${meals?.first.mealType}');
    return FoodPageState(
      meals: meals ?? this.meals
    );
  }
}
