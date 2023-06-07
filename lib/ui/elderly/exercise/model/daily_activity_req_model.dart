import 'package:json_annotation/json_annotation.dart';

part 'daily_activity_req_model.g.dart';

@JsonSerializable()
class DailyActivityModel {
  const DailyActivityModel({this.burnCaloriePoint = 0, this.timePoint = 0});

  ///convert from json
  factory DailyActivityModel.fromJson(Map<String, dynamic> json) =>
      _$DailyActivityModelFromJson(json);
  Map<String, dynamic> toJson() => _$DailyActivityModelToJson(this);

  final num timePoint;
  final num burnCaloriePoint;

  DailyActivityModel get empty => DailyActivityModel();

  DailyActivityModel copyWith({
    num? timePoint,
    num? burnCaloriePoint,
  }) =>
      DailyActivityModel(
        timePoint: timePoint ?? this.timePoint,
        burnCaloriePoint: burnCaloriePoint ?? this.burnCaloriePoint,
      );

  List<Object?> get props => <Object>[
        timePoint,
        burnCaloriePoint,
      ];
}
