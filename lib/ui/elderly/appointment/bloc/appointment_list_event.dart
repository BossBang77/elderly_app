import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';

abstract class AppointmentListEvent extends Equatable {
  const AppointmentListEvent();
}

class AppointmentListFetch extends AppointmentListEvent {
  const AppointmentListFetch({this.appointments = const[]});
  final List<Appointment> appointments;
  
  @override
  List<Object?> get props => [appointments];
}

class AppointmentApproved extends AppointmentListEvent {
  const AppointmentApproved({required this.appointmentId});

  final String appointmentId;

  @override
  List<Object?> get props => [appointmentId];
}

