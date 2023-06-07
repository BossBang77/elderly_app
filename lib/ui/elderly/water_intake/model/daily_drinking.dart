import 'package:json_annotation/json_annotation.dart';

part 'daily_drinking.g.dart';

@JsonSerializable()
class DailyWaterModel {
  const DailyWaterModel(
      {this.containerCode = '',
      this.id = '',
      this.numberOfDrink = 0,
      this.volume = 0});

  final String id;
  final String containerCode;

  final int numberOfDrink;

  final int volume;

  //convert from json
  factory DailyWaterModel.fromJson(Map<String, dynamic> json) =>
      _$DailyWaterModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWaterModelToJson(this);

  DailyWaterModel copyWith(
          {String? id,
          String? containerCode,
          int? numberOfDrink,
          int? volume}) =>
      DailyWaterModel(
          id: id ?? this.id,
          containerCode: containerCode ?? this.containerCode,
          numberOfDrink: numberOfDrink ?? this.numberOfDrink,
          volume: volume ?? this.volume);

  List<Object?> get props => <Object>[id, containerCode, numberOfDrink, volume];
}
