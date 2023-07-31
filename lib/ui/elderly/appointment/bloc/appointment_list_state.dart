import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment/model/response/elderly.dart';
import 'package:health_application/ui/elderly/appointment/segmented_control.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';

class AppointmentListState extends Equatable {
  const AppointmentListState(
      {required this.type,
      this.offset = 0,
      this.appointments = const [],
      this.completedAppointments = const [],
      this.currentMonth = ''});

  final List<Appointment> appointments;
  final List<Appointment> completedAppointments;
  final AppointmentListType type;

  final int limit = 20;
  final int offset;
  final String currentMonth;

  @override
  List<Object?> get props =>
      [appointments, completedAppointments, type, offset, currentMonth];

  AppointmentListState copyWith(
      {List<Appointment>? appointments,
      List<Appointment>? completedAppointments,
      AppointmentListType? type,
      int? offset,
      String? currentMonth}) {
    return AppointmentListState(
        appointments: appointments ?? this.appointments,
        completedAppointments:
            completedAppointments ?? this.completedAppointments,
        type: type ?? this.type,
        offset: offset ?? this.offset,
        currentMonth: currentMonth ?? this.currentMonth);
  }
}
