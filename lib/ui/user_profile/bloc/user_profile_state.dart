part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  const UserProfileState({
    this.userProfile = const RegisterModel(),
    this.status = UserProfileStatus.initial,
    this.scanLoading = ScannerLoadStatus.done,
    this.elderlyProfile = const ElderlyProfileModel(),
    this.scanStatus = ScanStatus.initial,
  });

  final RegisterModel userProfile;
  final UserProfileStatus status;
  final ScannerLoadStatus scanLoading;
  final ElderlyProfileModel elderlyProfile;
  final ScanStatus scanStatus;

  UserProfileState copyWith(
      {RegisterModel? userProfile,
      UserProfileStatus? status,
      ScannerLoadStatus? scanLoading,
      ElderlyProfileModel? elderlyProfile,
      ScanStatus? scanStatus}) {
    return UserProfileState(
      userProfile: userProfile ?? this.userProfile,
      status: status ?? this.status,
      scanLoading: scanLoading ?? this.scanLoading,
      elderlyProfile: elderlyProfile ?? this.elderlyProfile,
      scanStatus: scanStatus ?? this.scanStatus,
    );
  }

  @override
  List<Object> get props => [userProfile, status, scanLoading, elderlyProfile];
}

enum UserProfileStatus { initial, loading, success, fail }

enum ScannerLoadStatus { loading, done }

enum ScanStatus { initial, fail, success }

class UserProfileInitial extends UserProfileState {}
