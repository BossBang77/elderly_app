import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_history_status_section/appointment_history_status.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/page/appointment_page_approved.dart';
import 'package:health_application/ui/elderly/appointment_detail/page/appointment_page_history.dart';
import 'package:health_application/ui/elderly/appointment_detail/page/appointment_page_state.dart';
import 'package:health_application/ui/elderly/appointment_detail/page/appointment_page_waitforapprove.dart';

abstract class AppointmentDetailState extends Equatable {
  const AppointmentDetailState({
    this.appointment = const Appointment()
  });

  final Appointment appointment;
  AppointmetnPageState get pageState => AppointmetnPageStateWaitForApprove();

  static AppointmentDetailState stateFrom(Appointment appointment) {
    if (appointment.status == AppointmentStatus.create.value) {
      return AppointmentDetailWaitForApproveState(appointment: appointment);
    }
    if (appointment.status == AppointmentStatus.waitingtostart.value) {
      return AppointmentDetailApprovedState(appointment: appointment);
    }
    if (appointment.status == AppointmentStatus.start.value) {
      return AppointmentDetailApprovedState(appointment: appointment);
    }
    if (appointment.status == AppointmentStatus.complete.value || appointment.status == AppointmentStatus.reject.value) {
      return AppointmentDetailHistoryState(appointment: appointment);
    }
    return AppointmentDetailWaitForApproveState(appointment: appointment);
  }
}

class AppointmentDetailWaitForApproveState extends AppointmentDetailState {
  const AppointmentDetailWaitForApproveState({
    required this.appointment
  });

  final Appointment appointment;
  AppointmetnPageState get pageState => AppointmetnPageStateWaitForApprove();

  @override
  List<Object?> get props => [appointment];
}

class AppointmentDetailHistoryState extends AppointmentDetailState {
  const AppointmentDetailHistoryState({
    required this.appointment
  }): super(appointment: appointment);

  final Appointment appointment;

  AppointmentHistoryStatus get historyStatus => AppointmentHistoryStatus.fromString(appointment.status);
  AppointmetnPageState get pageState => AppointmetnPageStateHistory();

  @override
  List<Object?> get props => [historyStatus, appointment];
}

class AppointmentDetailApprovedState extends AppointmentDetailState {
  const AppointmentDetailApprovedState({
    required this.appointment
  }): super(appointment: appointment);

  final Appointment appointment;
  
  AppointmentStatus get appointmentStatus => AppointmentStatus.fromString(appointment.status) ?? AppointmentStatus.create;
  AppointmetnPageState get pageState => AppointmetnPageStateApproved();

  @override
  List<Object?> get props => [appointmentStatus, appointment];
}