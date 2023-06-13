import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment/repository/appointment_repository.dart';
import 'package:health_application/ui/elderly/appointment_detail/bloc/appointment_detail_event.dart';
import 'package:health_application/ui/elderly/appointment_detail/bloc/appointment_detail_state.dart';

class AppointmentDetailBloc extends Bloc<AppointmentDetailEvent, AppointmentDetailState> {
  AppointmentDetailBloc(
    Appointment appointment,
    AppointmentRepositoryProtocol appointmentRepository
  ): 
  _appointmentRepository = appointmentRepository,
  super(AppointmentDetailState.stateFrom(appointment)) {
    on<AppointmentStatusChanged>(_onAppointmentRequestApproved);
  }
  
  AppointmentRepositoryProtocol _appointmentRepository;

  void _onAppointmentRequestApproved(
    AppointmentStatusChanged event,
    Emitter<AppointmentDetailState> emit
  ) {
    Appointment updatedAppointment = state.appointment.updateStatus(event.status);
    AppointmentDetailState newState = AppointmentDetailState.stateFrom(updatedAppointment);
    emit(newState);
  }
}