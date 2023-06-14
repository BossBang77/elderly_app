import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment/segmented_control.dart';

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

class AppointmentSelectListType extends AppointmentListEvent {
  const AppointmentSelectListType({required this.type});

  final AppointmentListType type;
  
  @override
  List<Object?> get props => [type];
}

class AppointmentListUpdate extends AppointmentListEvent {
  const AppointmentListUpdate({
    this.completedList = const[],
    this.incompleteList = const[]
  });

  final List<Appointment> completedList;
  final List<Appointment> incompleteList;

  @override
  List<Object?> get props => [
    completedList,
    incompleteList
  ];
}
