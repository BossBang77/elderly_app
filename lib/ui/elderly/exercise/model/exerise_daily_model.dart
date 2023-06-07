import 'package:json_annotation/json_annotation.dart';

part 'exerise_daily_model.g.dart';

@JsonSerializable()
class ExerciseDailyModel {
  const ExerciseDailyModel(
      {this.burnCaloriePoint = 0,
      this.burnCalorieTarget = 0,
      this.timePoint = 0,
      this.timeTarget = 0});

  ///convert from json
  factory ExerciseDailyModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDailyModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseDailyModelToJson(this);

  final num timePoint;
  final num burnCaloriePoint;
  final num timeTarget;
  final num burnCalorieTarget;
  ExerciseDailyModel get empty => ExerciseDailyModel();

  ExerciseDailyModel copyWith(
          {num? timePoint,
          num? burnCaloriePoint,
          num? timeTarget,
          num? burnCalorieTarget}) =>
      ExerciseDailyModel(
          timePoint: timePoint ?? this.timePoint,
          burnCaloriePoint: burnCaloriePoint ?? this.burnCaloriePoint,
          timeTarget: timeTarget ?? this.timeTarget,
          burnCalorieTarget: burnCalorieTarget ?? this.burnCalorieTarget);

  List<Object?> get props =>
      <Object>[timePoint, timeTarget, burnCaloriePoint, burnCalorieTarget];
}
