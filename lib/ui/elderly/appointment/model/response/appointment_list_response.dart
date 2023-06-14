import 'package:health_application/ui/elderly/appointment/model/decodable.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment_list_response.g.dart';

@JsonSerializable()
class AppointmentListResponse implements Decodable<AppointmentListResponse> {
  const AppointmentListResponse({this.data = const[]});

  final List<Appointment> data;

  factory AppointmentListResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentListResponseToJson(this);

  List<Object?> get props => <Object>[data];
  
  @override
  AppointmentListResponse decode(Map<String, dynamic> json) {
    return _$AppointmentListResponseFromJson(json);
  }
}