import 'package:health_application/ui/elderly/food_log/model/response/meal_record_item.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';

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
  final List<MealRecordItem> foods;
  double get calories => foods.fold(0, (value, element) => value +  element.unit * element.calorie);
  
  const Meal({required this.mealType, this.foods = const[]});

  Meal copyWith({
    MealType? mealType,
    List<MealRecordItem>? foods,
    double? calories
  }) {
    return Meal(
      mealType: mealType ?? this.mealType,
      foods: foods ?? this.foods
    );
  }
}

