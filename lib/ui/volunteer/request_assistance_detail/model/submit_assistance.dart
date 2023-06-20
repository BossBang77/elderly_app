import 'package:json_annotation/json_annotation.dart';
part 'submit_assistance.g.dart';

@JsonSerializable()
class SubmitAssistance {
  const SubmitAssistance(
      {this.addressFull = '',
      this.emergencyId = '',
      this.latitude = 0,
      this.longitude = 0});

  ///convert from json
  factory SubmitAssistance.fromJson(Map<String, dynamic> json) =>
      _$SubmitAssistanceFromJson(json);
  Map<String, dynamic> toJson() => _$SubmitAssistanceToJson(this);
  final String emergencyId;
  final String addressFull;
  final double latitude;
  final double longitude;

  SubmitAssistance get empty => SubmitAssistance();

  SubmitAssistance copyWith(
          {String? emergencyId,
          String? addressFull,
          double? latitude,
          double? longitude}) =>
      SubmitAssistance(
          emergencyId: emergencyId ?? this.emergencyId,
          addressFull: addressFull ?? this.addressFull,
          latitude: latitude ?? this.latitude,
          longitude: longitude ?? this.longitude);

  List<Object?> get props =>
      <Object>[latitude, latitude, addressFull, emergencyId];
}
