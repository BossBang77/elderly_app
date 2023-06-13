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
