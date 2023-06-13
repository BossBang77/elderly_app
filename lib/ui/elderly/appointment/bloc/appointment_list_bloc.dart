import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_event.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_state.dart';
import 'package:health_application/ui/elderly/appointment/model/request/appointment_list_request.dart';
import 'package:health_application/ui/elderly/appointment/model/request/update_appointment_request.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment/repository/appointment_repository.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';

class AppointmentListBloc extends Bloc<AppointmentListEvent, AppointmentListState> {
  AppointmentListBloc(
    AppointmentRepositoryProtocol appointmentRepository
  ): 
  _appointmentRepository = appointmentRepository,
  super(AppointmentListState()) {
    on<AppointmentListFetch>(_onAppointmentListFetched);
    on<AppointmentApproved>(_onAppointmentApproved);
  }

  final AppointmentRepositoryProtocol _appointmentRepository;

  void fetchAppointmentList() async {
    final request = AppointmentListRequest(
      limit: 10,
      offset: 0,
      elderlyProfileId: '',
      volunteerProfileId: '',
      includeStatus: '',
      excludeStatus: ''
    );
    
    final response = await _appointmentRepository.getAppointmentList(request);
    response.fold(
      (error)  {
        //TODO: handle failed response
      }, 
      (response) {
        add(AppointmentListFetch(appointments: response.data));
      });
  }
  
  void _onAppointmentListFetched(
    AppointmentListFetch event,
    Emitter<AppointmentListState> emit
  ) {
    emit(state.copyWith(appointments: event.appointments));
  }

  void _onAppointmentApproved(
    AppointmentApproved event,
    Emitter<AppointmentListState> emit
  ) async {
    final appointments = List.from(state.appointments);
    final index = appointments.indexWhere((element) => element.id == event.appointmentId);
    appointments[index].updateStatus(AppointmentStatus.waitingtostart.value);
    final List<Appointment> newAppointment = List.from(appointments);

    final request = UpdateAppointmentRequest(
      appointmentId: event.appointmentId,
      status: AppointmentStatus.waitingtostart.value
    );
    final response = await _appointmentRepository.updateAppointmentStatus(request);
    response.fold(
      (error) {

      },
      (response) {
        
      }
    );

    emit(state.copyWith(appointments: newAppointment));
  }
}
