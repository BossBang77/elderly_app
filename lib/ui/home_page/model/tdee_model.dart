import 'package:json_annotation/json_annotation.dart';

part 'tdee_model.g.dart';

@JsonSerializable()
class TDEEModel {
  const TDEEModel({
    this.burnCalorie = 0,
    this.eatingCalorieAchievable = 0,
    this.eatingCalorieLimit = 0,
    this.eatingCalorieRemaining = 0
  });

  final double burnCalorie;
  final double eatingCalorieAchievable;
  final double eatingCalorieLimit;
  final double eatingCalorieRemaining;

  List<Object?> get props => <Object>[
    burnCalorie,
    eatingCalorieAchievable,
    eatingCalorieLimit,
    eatingCalorieRemaining
  ];

  factory TDEEModel.fromJson(Map<String, dynamic> json) =>  _$TDEEModelFromJson(json);
}