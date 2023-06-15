part of 'request_assistance_bloc.dart';

class RequestAssistanceState extends Equatable {
  const RequestAssistanceState(
      {this.assistanceStatus = AssistanceStatus.emergencyCall});

  final AssistanceStatus assistanceStatus;

  RequestAssistanceState copyWith({AssistanceStatus? assistanceStatus}) {
    return RequestAssistanceState(
        assistanceStatus: assistanceStatus ?? this.assistanceStatus);
  }

  @override
  List<Object> get props => [assistanceStatus];
}

class RequestAssistanceInitial extends RequestAssistanceState {}

enum AssistanceStatus { emergencyCall, waitingForHelp, volunteerAccept }
