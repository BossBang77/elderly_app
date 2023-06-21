part of 'request_assistance_bloc.dart';

class RequestAssistanceState extends Equatable {
  const RequestAssistanceState(
      {this.emergencyDetail = const AssitanceDetailModel(),
      this.isLoading = false,
      this.elderlyProfile = const ElderlyProfileModel(),
      this.eventStatus = EventStatus.initial});
  final AssitanceDetailModel emergencyDetail;
  final bool isLoading;
  final ElderlyProfileModel elderlyProfile;
  final EventStatus eventStatus;
  RequestAssistanceState copyWith(
      {AssitanceDetailModel? emergencyDetail,
      bool? isLoading,
      ElderlyProfileModel? elderlyProfile,
      EventStatus? eventStatus}) {
    return RequestAssistanceState(
        emergencyDetail: emergencyDetail ?? this.emergencyDetail,
        isLoading: isLoading ?? this.isLoading,
        elderlyProfile: elderlyProfile ?? this.elderlyProfile,
        eventStatus: eventStatus ?? this.eventStatus);
  }

  @override
  List<Object> get props => [emergencyDetail, isLoading, eventStatus];
}

class RequestAssistanceInitial extends RequestAssistanceState {}

enum EventStatus { initial, searchElderlySuccess, searchElderlyFail }
