import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_event.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_state.dart';
import 'package:health_application/ui/elderly/appointment/model/request/appointment_list_request.dart';
import 'package:health_application/ui/elderly/appointment/model/request/update_appointment_request.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment/repository/appointment_repository.dart';
import 'package:health_application/ui/elderly/appointment/segmented_control.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';

class AppointmentListBloc
    extends Bloc<AppointmentListEvent, AppointmentListState> {
  AppointmentListBloc(AppointmentRepositoryProtocol appointmentRepository)
      : _appointmentRepository = appointmentRepository,
        super(AppointmentListState(type: AppointmentListType.incomplete)) {
    on<AppointmentListFetch>(_onAppointmentListFetched);
    on<AppointmentApproved>(_onAppointmentApproved);
    on<AppointmentSelectListType>(_onAppointmentSelectListType);
    on<AppointmentListUpdate>(_onAppointmentListUpdate);

    _incomplteListSubscriber = _appointmentRepository
        .incompletedListController.stream
        .asBroadcastStream()
        .listen((List<Appointment> data) {
      add(AppointmentListUpdate(
          incompleteList: data, type: AppointmentListType.incomplete));
    });

    _completeListSubscriber = _appointmentRepository
        .completedListController.stream
        .asBroadcastStream()
        .listen((List<Appointment> data) {
      add(AppointmentListUpdate(
          completedList: data, type: AppointmentListType.completed));
    });

    fetchAppointmentList();
  }

  late StreamSubscription<List<Appointment>> _completeListSubscriber;
  late StreamSubscription<List<Appointment>> _incomplteListSubscriber;
  final AppointmentRepositoryProtocol _appointmentRepository;

  void fetchAppointmentList(
      {String? elderlyProfileId,
      String? volunteerProfileId,
      String? includeStatus,
      String? excludeStatus}) async {
    String volunteerProfileId = await UserSecureStorage().getUID();
    final request = AppointmentListRequest(
        limit: state.limit,
        offset: state.offset,
        elderlyProfileId: elderlyProfileId,
        volunteerProfileId: volunteerProfileId,
        includeStatus: includeStatus,
        excludeStatus: excludeStatus);

    final response = await _appointmentRepository.getAppointmentList(request);
  }

  void _onAppointmentListFetched(
      AppointmentListFetch event, Emitter<AppointmentListState> emit) {
    emit(state.copyWith(appointments: event.appointments));
  }

  void _onAppointmentApproved(
      AppointmentApproved event, Emitter<AppointmentListState> emit) async {
    final appointments = List.from(state.appointments);
    final index =
        appointments.indexWhere((element) => element.id == event.appointmentId);
    final updatedAppointment = appointments[index]
        .updateStatus(AppointmentStatus.waitingtostart.value);
    appointments[index] = updatedAppointment;
    final List<Appointment> newAppointmentList = List.from(appointments);

    final request = UpdateAppointmentRequest(
        appointmentId: event.appointmentId,
        status: AppointmentStatus.waitingtostart.value);
    final response =
        await _appointmentRepository.updateAppointmentStatus(request);
    emit(state.copyWith(appointments: newAppointmentList));
  }

  void _onAppointmentSelectListType(
      AppointmentSelectListType event, Emitter<AppointmentListState> emit) {
    emit(state.copyWith(type: event.type));
    if (event.type == AppointmentListType.completed) {
      fetchAppointmentList();
    } else {
      fetchAppointmentList(excludeStatus: AppointmentStatus.complete.value);
    }
  }

  void _onAppointmentListUpdate(
      AppointmentListUpdate event, Emitter<AppointmentListState> emit) {
    if (event.type == AppointmentListType.completed) {
      emit(state.copyWith(completedAppointments: event.completedList));
    } else {
      emit(state.copyWith(appointments: event.incompleteList));
    }
  }
}
