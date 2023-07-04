import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/food_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'elderly_log_food_model.g.dart';

@JsonSerializable()
class ElderlyLogFoodModel {
  const ElderlyLogFoodModel({
    this.breakfast = const [],
    this.lunch = const [],
    this.snack = const [],
    this.dinner = const [],
  });

  ///convert from json
  factory ElderlyLogFoodModel.fromJson(Map<String, dynamic> json) =>
      _$ElderlyLogFoodModelFromJson(json);
  Map<String, dynamic> toJson() => _$ElderlyLogFoodModelToJson(this);

  final List<FoodModel> breakfast;
  final List<FoodModel> lunch;
  final List<FoodModel> snack;
  final List<FoodModel> dinner;
}
