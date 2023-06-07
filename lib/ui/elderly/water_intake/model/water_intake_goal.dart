import 'package:json_annotation/json_annotation.dart';
part 'water_intake_goal.g.dart';

@JsonSerializable()
class WaterIntakeGoalModel {
  const WaterIntakeGoalModel(
      {this.achievable = 0, this.remaining = 0, this.target = 0});

  final num target;

  final num remaining;

  final num achievable;

  //convert from json
  factory WaterIntakeGoalModel.fromJson(Map<String, dynamic> json) =>
      _$WaterIntakeGoalModelFromJson(json);

  WaterIntakeGoalModel copyWith(
          {num? target, num? remaining, num? achievable}) =>
      WaterIntakeGoalModel(
          target: target ?? this.target,
          remaining: remaining ?? this.remaining,
          achievable: achievable ?? this.achievable);

  List<Object?> get props => <Object>[target, remaining, achievable];
}
