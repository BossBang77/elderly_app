import 'package:json_annotation/json_annotation.dart';

part 'appointment_generic_data.g.dart';

@JsonSerializable()
class AppointmentGenericData {
  const AppointmentGenericData({
    this.name = '',
    this.code = ''
  });

  final String name;
  final String code;

  factory AppointmentGenericData.fromJson(Map<String, dynamic> json) => _$AppointmentGenericDataFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentGenericDataToJson(this);

  List<Object?> get props => <Object>[
    name,
    code
  ]; 
}