import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/appointment/model/request/update_appointment_request.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment/repository/appointment_repository.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/bloc/appointment_detail_event.dart';
import 'package:health_application/ui/elderly/appointment_detail/bloc/appointment_detail_state.dart';

class AppointmentDetailBloc extends Bloc<AppointmentDetailEvent, AppointmentDetailState> {
  AppointmentDetailBloc(
    Appointment appointment,
    AppointmentRepositoryProtocol appointmentRepository
  ): 
  _appointmentRepository = appointmentRepository,
  super(AppointmentDetailState.stateFrom(appointment)) {
    on<AppointmentStatusChanged>(_onAppointmentStatusChanged);
  }
  
  AppointmentRepositoryProtocol _appointmentRepository;

  void _onAppointmentStatusChanged(
    AppointmentStatusChanged event,
    Emitter<AppointmentDetailState> emit
  ) async {
    Appointment updatedAppointment = state.appointment.updateStatus(event.status);
    AppointmentDetailState newState = AppointmentDetailState.stateFrom(updatedAppointment);
    final request = UpdateAppointmentRequest(
      appointmentId: state.appointment.id,
      status: event.status
    );

    final response = await _appointmentRepository.updateAppointmentStatus(request);
    response.fold(
      (error) {

      },
      (response) {
        if (event.status != AppointmentStatus.complete.value) {
          final appointments = List.from(_appointmentRepository.currentIncompleteList);
          final index = appointments.indexWhere((element) => element.id == state.appointment.id);
          final updatedAppointment = appointments[index].updateStatus(event.status);
          appointments[index] = updatedAppointment;
          final List<Appointment> newAppointmentList = List.from(appointments);
          _appointmentRepository.incompletedListController.sink.add(newAppointmentList);
          _appointmentRepository.currentIncompleteList = newAppointmentList;
        } else {
          final appointments = List.from(_appointmentRepository.currentIncompleteList);
          final index = appointments.indexWhere((element) => element.id == state.appointment.id);
          final removeItem = appointments[index];

          final completedAppointmentList = List.from(_appointmentRepository.currentCompleteList);
          completedAppointmentList.add(removeItem);

          appointments.removeAt(index);
          final List<Appointment> newAppointmentList = List.from(appointments);
          _appointmentRepository.incompletedListController.sink.add(newAppointmentList);
          _appointmentRepository.currentIncompleteList = newAppointmentList;
          _appointmentRepository.completedListController.sink.add(List.from(completedAppointmentList));
          _appointmentRepository.currentCompleteList = List.from(completedAppointmentList);
        }
        emit(newState);
      }
    );
  }
}