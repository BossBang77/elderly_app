import 'package:health_application/ui/food/model/food/food.dart';

abstract class MealLogWidgetIconImageProvider {
  const MealLogWidgetIconImageProvider({required this.iconImage});

  final String iconImage;
}

enum MealType implements MealLogWidgetIconImageProvider {
  breakfast(name: "อาหารเช้า", iconImage: 'assets/images/breakfast.png'),
  lunch(name: "อาหารกลางวัน", iconImage: 'assets/images/lunch.png'),
  snack(name: "อาหารว่าง", iconImage: 'assets/images/snack.png'),
  dinner(name: "อาหารเย็น", iconImage: 'assets/images/dinner.png');

  final String name;
  final String iconImage;

  const MealType({required this.name, required this.iconImage});
}

class Meal {
  final MealType mealType;
  final List<Food> foods;
  final double calories;
  
  const Meal({required this.mealType, this.foods = const[], this.calories = 0});
}

