import 'package:health_application/ui/elderly/appointment/model/decodable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_appointment_request.g.dart';

@JsonSerializable()
class UpdateAppointmentRequest implements Decodable<UpdateAppointmentRequest> {
  const UpdateAppointmentRequest({
    this.appointmentId = '',
    this.status = ''
  });
  final String appointmentId;
  final String status;

  factory UpdateAppointmentRequest.fromJson(Map<String, dynamic> json) => _$UpdateAppointmentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateAppointmentRequestToJson(this);

  List<Object?> get props => <Object>[
    appointmentId, 
    status
  ];
  
  @override
  UpdateAppointmentRequest decode(Map<String, dynamic> json) {
    // TODO: implement decode
    throw UnimplementedError();
  }
}