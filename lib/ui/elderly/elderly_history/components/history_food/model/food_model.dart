import 'package:json_annotation/json_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable()
class FoodModel {
  const FoodModel({
    this.id = '',
    this.code = '',
    this.name = '',
    this.image = '',
    this.calories = 0,
    this.unit = 1,
  });

  ///convert from json
  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);

  final String id;
  final String code;
  final String name;
  final String image;
  final num unit;
  @JsonKey(name: 'calorie')
  final num calories;
}
