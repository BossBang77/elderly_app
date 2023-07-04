import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/graph_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'elderly_food_model.g.dart';

@JsonSerializable()
class ElderlyFoodModel {
  const ElderlyFoodModel({
    this.calories = const [],
    this.sugar = const [],
    this.protein = const [],
    this.carb = const [],
    this.fat = const [],
  });

  ///convert from json
  factory ElderlyFoodModel.fromJson(Map<String, dynamic> json) =>
      _$ElderlyFoodModelFromJson(json);

  final List<GraphModel> calories;
  final List<GraphModel> sugar;
  final List<GraphModel> protein;
  final List<GraphModel> carb;
  final List<GraphModel> fat;
}
