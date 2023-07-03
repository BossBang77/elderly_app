
import 'package:json_annotation/json_annotation.dart';

part 'elderly_drinking_model.g.dart';

@JsonSerializable()
class ElderlyDrinkingModel {
  const ElderlyDrinkingModel({
    this.bottleSize = '',
    this.unit = '',
    this.size = '',
  });

  ///convert from json
  factory ElderlyDrinkingModel.fromJson(Map<String, dynamic> json) =>
      _$ElderlyDrinkingModelFromJson(json);

  final String bottleSize;
  final String unit;
  final String size;
}
