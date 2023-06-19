part of 'request_assistance_bloc.dart';

class RequestAssistanceEvent extends Equatable {
  const RequestAssistanceEvent();

  @override
  List<Object> get props => [];
}

class UpdateStatus extends RequestAssistanceEvent {
  final AssistanceStatus status;
  const UpdateStatus({this.status = AssistanceStatus.emergencyCall});
  @override
  List<Object> get props => [status];
}
