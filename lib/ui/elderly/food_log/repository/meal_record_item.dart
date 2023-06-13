import 'package:health_application/ui/elderly/food_log/model/response/meal_record_item.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_search_item.dart';

class MealRecordItem {
  const MealRecordItem({
    this.code = '',
    this.unit = 0,
    this.calorie = 0,
    this.name = '',
    this.image = ''
  });

  final String code;
  final int unit;
  final double calorie;
  final String name;
  final String image;

  factory MealRecordItem.fromResponse(MealRecordResponseItem meal) {
    return MealRecordItem(
      code: meal.code,
      unit: meal.unit,
      calorie: meal.calorie,
      name: meal.mame
    );
  }

  factory MealRecordItem.fromSearch(FoodSearchItem meal) {
    return MealRecordItem(
      code: meal.code,
      unit: 1,
      calorie: meal.calorie,
      name: meal.name,
      image: meal.image
    );
  }
}