import 'package:json_annotation/json_annotation.dart';

part 'daily_activity_req_model.g.dart';

@JsonSerializable()
class DailyActivityModel {
  const DailyActivityModel(
      {this.burnCaloriePoint = 0,
      this.timePoint = 0,
      this.code = '',
      this.name = ''});

  ///convert from json
  factory DailyActivityModel.fromJson(Map<String, dynamic> json) =>
      _$DailyActivityModelFromJson(json);
  Map<String, dynamic> toJson() => _$DailyActivityModelToJson(this);

  final num timePoint;
  final num burnCaloriePoint;
  final String code;
  final String name;

  DailyActivityModel get empty => DailyActivityModel();

  DailyActivityModel copyWith(
          {num? timePoint,
          num? burnCaloriePoint,
          String? code,
          String? name}) =>
      DailyActivityModel(
          timePoint: timePoint ?? this.timePoint,
          burnCaloriePoint: burnCaloriePoint ?? this.burnCaloriePoint,
          code: code ?? this.code,
          name: name ?? this.name);

  List<Object?> get props => <Object>[timePoint, burnCaloriePoint, code, name];
}
