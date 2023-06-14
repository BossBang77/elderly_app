import 'package:health_application/ui/elderly/appointment/model/decodable.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment_response.g.dart';

@JsonSerializable()
class AppointmentResponse implements Decodable<AppointmentResponse> {
  const AppointmentResponse({this.data = const Appointment()});

  final Appointment data;

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentResponseToJson(this);

  List<Object?> get props => <Object>[data];
  
  @override
  AppointmentResponse decode(Map<String, dynamic> json) {
    return _$AppointmentResponseFromJson(json);
  }
}