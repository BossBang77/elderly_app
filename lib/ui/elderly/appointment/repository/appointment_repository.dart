import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/base/model/status_code.dart';
import 'package:health_application/ui/base/network_provider.dart';
import 'package:health_application/ui/elderly/appointment/model/request/appointment_list_request.dart';
import 'package:health_application/ui/elderly/appointment/model/request/update_appointment_request.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment_list_response.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment_response.dart';
import 'package:health_application/ui/elderly/appointment/repository/response_handler.dart';
import 'package:health_application/ui/elderly/appointment/service/appointment_service.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';
import 'package:retrofit/retrofit.dart';

abstract class AppointmentRepositoryProtocol {
  Future<Either<Failure, AppointmentListResponse>> getAppointmentList(
      AppointmentListRequest request);
  Future<Either<Failure, AppointmentResponse>> getAppointmentById(String id);
  Future<Either<Failure, HttpResponse>> updateAppointmentStatus(
      UpdateAppointmentRequest request);

  late StreamController<List<Appointment>> incompletedListController;
  late StreamController<List<Appointment>> completedListController;
  late List<Appointment> currentIncompleteList;
  late List<Appointment> currentCompleteList;
}

class AppointmentRepository implements AppointmentRepositoryProtocol {
  final NetworkProvider networkProvider = NetworkProvider();
  late final AppointmentService _appointmentService =
      AppointmentService(networkProvider.dioClient());
  ResponseHandler jsonResponseHandler = JsonResponseHandler();
  StreamController<List<Appointment>> incompletedListController =
      StreamController<List<Appointment>>.broadcast();
  StreamController<List<Appointment>> completedListController =
      StreamController<List<Appointment>>.broadcast();
  List<Appointment> currentIncompleteList = const [];
  List<Appointment> currentCompleteList = const [];

  AppointmentRepository._();
  static final instance = AppointmentRepository._();

  @override
  Future<Either<Failure, AppointmentListResponse>> getAppointmentList(
      AppointmentListRequest request) async {
    return jsonResponseHandler.handleResponseFrom(
        request: _appointmentService.getAppointmentList(
            request.limit,
            request.offset,
            request.includeStatus,
            request.elderlyProfileId,
            request.volunteerProfileId,
            request.excludeStatus),
        decodeWith: (data) {
          var dataFromJson = AppointmentListResponse.fromJson(data).data;
          var completedList = dataFromJson
              .where((element) =>
                  (element.status == AppointmentStatus.complete.value) ||
                  (element.status == AppointmentStatus.reject.value))
              .toList();
          completedListController.sink.add(completedList);
          currentCompleteList = completedList;

          var inCompletedList = dataFromJson
              .where((element) =>
                  (element.status != AppointmentStatus.complete.value) &&
                  (element.status != AppointmentStatus.reject.value))
              .toList();
          incompletedListController.sink.add(inCompletedList);
          currentIncompleteList = inCompletedList;
          return AppointmentListResponse.fromJson(data);
        });
  }

  @override
  Future<Either<Failure, AppointmentResponse>> getAppointmentById(
      String id) async {
    return jsonResponseHandler.handleResponseFrom(
        request: _appointmentService.getAppointmentById(id),
        decodeWith: (data) => AppointmentResponse.fromJson(data));
  }

  @override
  Future<Either<Failure, HttpResponse>> updateAppointmentStatus(
      UpdateAppointmentRequest request) {
    return jsonResponseHandler.handleGenericResponseFrom(
        _appointmentService.updateAppointmentStatus(request.toJson()));
  }
}
