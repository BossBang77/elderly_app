part of 'volunteer_information_bloc.dart';

class VolunteerInformationState extends Equatable {
  const VolunteerInformationState(
      {this.profile = const RegisterModel(),
      this.isLoading = false,
      this.statusUpdate = StatusUpdate.initial});

  final RegisterModel profile;
  final bool isLoading;
  final StatusUpdate statusUpdate;

  const VolunteerInformationState.initial(
      {this.profile = const RegisterModel(),
      this.isLoading = false,
      this.statusUpdate = StatusUpdate.initial});

  VolunteerInformationState copyWith(
      {RegisterModel? profile, bool? isLoading, StatusUpdate? statusUpdate}) {
    return VolunteerInformationState(
        profile: profile ?? this.profile,
        isLoading: isLoading ?? this.isLoading,
        statusUpdate: statusUpdate ?? this.statusUpdate);
  }

  @override
  List<Object> get props => [profile, isLoading, statusUpdate];
}

class VolunteerInformationInitial extends VolunteerInformationState {}

enum EditType { elderlyCareCode, experience }

enum StatusUpdate { success, fail, initial }
