part of 'request_assistance_bloc.dart';

class RequestAssistanceState extends Equatable {
  const RequestAssistanceState(
      {this.assistanceStatus = AssistanceStatus.initial,
      this.isLoading = false,
      this.emergencyHelpDetail = const EmergencyHelpDetailModel(),
      this.statusSubmit = StatusSubmit.initial});

  final AssistanceStatus assistanceStatus;
  final bool isLoading;
  final EmergencyHelpDetailModel emergencyHelpDetail;
  final StatusSubmit statusSubmit;

  RequestAssistanceState copyWith(
      {AssistanceStatus? assistanceStatus,
      bool? isLoading,
      EmergencyHelpDetailModel? emergencyHelpDetail,
      StatusSubmit? statusSubmit}) {
    return RequestAssistanceState(
        assistanceStatus: assistanceStatus ?? this.assistanceStatus,
        isLoading: isLoading ?? this.isLoading,
        emergencyHelpDetail: emergencyHelpDetail ?? this.emergencyHelpDetail,
        statusSubmit: statusSubmit ?? this.statusSubmit);
  }

  @override
  List<Object> get props =>
      [assistanceStatus, isLoading, emergencyHelpDetail, statusSubmit];
}

class RequestAssistanceInitial extends RequestAssistanceState {}

enum AssistanceStatus {
  initial,
  emergencyCall,
  waitingForHelp,
  volunteerAccept
}

enum EmergencyStatus { WAITING, VOLUNTEER_COMPLETE, ELDERLY_COMPLETE }

enum StatusSubmit {
  initial,
  sendSafeSuccess,
  sendSafeFail,
  createEmergencyFail
}
