import 'package:json_annotation/json_annotation.dart';

part 'elderly_drinking_model.g.dart';

@JsonSerializable()
class ElderlyDrinkingModel {
  const ElderlyDrinkingModel({
    this.id = '',
    this.containerCode = '',
    this.numberOfDrink = 0,
    this.volume = 0,
  });

  ///convert from json
  factory ElderlyDrinkingModel.fromJson(Map<String, dynamic> json) =>
      _$ElderlyDrinkingModelFromJson(json);

  final String id;
  final String containerCode;
  final num numberOfDrink;
  final num volume;
}
