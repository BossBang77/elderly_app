import 'package:json_annotation/json_annotation.dart';

part 'elderly_exercise_model.g.dart';

@JsonSerializable()
class ElderlyExerciseModel {
  const ElderlyExerciseModel({
    this.name = '',
    this.code = '',
    this.timePoint = 0,
    this.burnCaloriePoint = 0,
    this.images = '',
  });

  ///convert from json
  factory ElderlyExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ElderlyExerciseModelFromJson(json);

  final String name;
  final String code;
  final num timePoint;
  final num burnCaloriePoint;
  final String images;
}
