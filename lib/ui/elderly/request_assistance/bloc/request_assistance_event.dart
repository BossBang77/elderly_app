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

class CreateEmergency extends RequestAssistanceEvent {
  final CreateEmergencyModel createEmergencyModel;
  const CreateEmergency({required this.createEmergencyModel});
  @override
  List<Object> get props => [createEmergencyModel];
}

class SetLoading extends RequestAssistanceEvent {
  final bool loading;
  const SetLoading({this.loading = false});
  @override
  List<Object> get props => [loading];
}

class GetEmergencyDetail extends RequestAssistanceEvent {
  const GetEmergencyDetail();
}

class SubmitIsSafe extends RequestAssistanceEvent {
  const SubmitIsSafe();
}

class ResetSubmitStatus extends RequestAssistanceEvent {
  const ResetSubmitStatus();
}

class UpdateEmergetcyDetail extends RequestAssistanceEvent {
  const UpdateEmergetcyDetail();
}
