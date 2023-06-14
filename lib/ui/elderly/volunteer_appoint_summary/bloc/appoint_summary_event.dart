part of 'appoint_summary_bloc.dart';

class AppointSummaryEvent extends Equatable {
  const AppointSummaryEvent();

  @override
  List<Object> get props => [];
}

class GetAppointmentId extends AppointSummaryEvent {
  final String id;
  const GetAppointmentId({this.id = ''});
  @override
  List<Object> get props => [id];
}

class RejectAppointment extends AppointSummaryEvent {
  final String appointId;
  const RejectAppointment({this.appointId = ''});
  @override
  List<Object> get props => [appointId];
}

class UpdateStatus extends AppointSummaryEvent {
  final StatusUpdate statusUpdate;
  const UpdateStatus({this.statusUpdate = StatusUpdate.initialState});
  @override
  List<Object> get props => [statusUpdate];
}
