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

  @JsonKey(name: 'calories')
  final List<GraphModel> calories;
  @JsonKey(name: 'sugars')
  final List<GraphModel> sugar;
  @JsonKey(name: 'proteins')
  final List<GraphModel> protein;
  @JsonKey(name: 'carbohydrates')
  final List<GraphModel> carb;
  @JsonKey(name: 'fats')
  final List<GraphModel> fat;
}
