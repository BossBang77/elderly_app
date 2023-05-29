import 'package:json_annotation/json_annotation.dart';

part 'intake_water_model.g.dart';

@JsonSerializable()
class IntakeWaterModel {
  const IntakeWaterModel(
      {this.volumeName = '', this.volumeQuantity = 0, this.volumeValue = 0});

  final String volumeName;

  final int volumeValue;

  final int volumeQuantity;

  //convert from json
  factory IntakeWaterModel.fromJson(Map<String, dynamic> json) =>
      _$IntakeWaterModelFromJson(json);

  IntakeWaterModel copyWith(
          {String? volumeName, int? volumeQuantity, int? volumeValue}) =>
      IntakeWaterModel(
          volumeName: volumeName ?? this.volumeName,
          volumeQuantity: volumeQuantity ?? this.volumeQuantity,
          volumeValue: volumeValue ?? this.volumeValue);

  List<Object?> get props => <Object>[volumeName, volumeValue, volumeQuantity];
}
