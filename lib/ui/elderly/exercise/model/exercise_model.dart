import 'package:json_annotation/json_annotation.dart';

part 'exercise_model.g.dart';

@JsonSerializable()
class ExerciseModel {
  const ExerciseModel(
      {this.name = '',
      this.code = '',
      this.timePoint = 0,
      this.burnCaloriePoint = 0});

  ///convert from json
  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);

  final String name;
  final String code;
  final double timePoint;
  final double burnCaloriePoint;

  ExerciseModel get empty => ExerciseModel();

  ExerciseModel copyWith(
          {String? name,
          String? code,
          double? timePoint,
          double? burnCaloriePoint}) =>
      ExerciseModel(
          name: name ?? this.name,
          code: code ?? this.code,
          timePoint: timePoint ?? this.timePoint,
          burnCaloriePoint: burnCaloriePoint ?? this.burnCaloriePoint);

  List<Object?> get props => <Object>[name, code, timePoint, burnCaloriePoint];
}
