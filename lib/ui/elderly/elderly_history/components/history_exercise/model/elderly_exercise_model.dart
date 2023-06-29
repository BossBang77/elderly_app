import 'package:json_annotation/json_annotation.dart';

part 'elderly_exercise_model.g.dart';

@JsonSerializable()
class ElderlyExerciseModel {
  const ElderlyExerciseModel({
    this.exerciseName = '',
    this.time = '',
    this.calories = '',
    this.images = '',
  });

  ///convert from json
  factory ElderlyExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ElderlyExerciseModelFromJson(json);

  final String exerciseName;
  final String time;
  final String calories;
  final String images;
}
