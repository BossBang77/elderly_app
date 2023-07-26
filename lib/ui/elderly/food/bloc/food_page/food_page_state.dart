import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food/model/food/meal.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/calories.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/carbohydrate.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/cholesterol.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/fat.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/protein.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/sugar.dart';
import 'package:health_application/ui/elderly/food_log/model/response/summary_calorie.dart';

class FoodPageState extends Equatable {
  FoodPageState(
      {this.meals = const [
        Meal(mealType: MealType.breakfast),
        Meal(mealType: MealType.lunch),
        Meal(mealType: MealType.snack),
        Meal(mealType: MealType.dinner),
      ],
      this.nutrients = const [
        Calories(value: 0),
        Fat(value: 0),
        Protein(value: 0),
        Carbohydrate(value: 0),
        Sugar(value: 0),
        Cholesterol(value: 0)
      ],
      this.summaryCalorie = const SummaryCalorie()});

  final List<Nutrient> nutrients;

  final List<Meal> meals;

  final SummaryCalorie summaryCalorie;

  @override
  List<Object> get props => [meals, nutrients, summaryCalorie];

  @override
  bool? get stringify => true;

  FoodPageState copyWith(
      {List<Nutrient>? nutrients,
      List<Meal>? meals,
      SummaryCalorie? summaryCalorie}) {
    return FoodPageState(
        nutrients: nutrients ?? this.nutrients,
        meals: meals ?? this.meals,
        summaryCalorie: summaryCalorie ?? this.summaryCalorie);
  }
}
