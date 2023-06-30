import 'package:json_annotation/json_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable()
class FoodModel {
  const FoodModel({
    this.foodName = '',
    this.size = '',
    this.calories = '',
    this.image = '',
    this.unit = '',
  });

  ///convert from json
  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);

  final String foodName;
  final String size;
  final String calories;
  final String image;
  final String unit;
}
