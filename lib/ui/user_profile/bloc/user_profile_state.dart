part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  const UserProfileState(
      {this.userProfile = const RegisterModel(),
      this.status = UserProfileStatus.initial,
      this.scanLoading = ScannerLoadStatus.done,
      this.elderlyProfile = const ElderlyProfileModel(),
      this.scanStatus = ScanStatus.initial,
      this.logoutStatus = LogoutStatus.initial,
      this.fullAddress = ''});

  final RegisterModel userProfile;
  final UserProfileStatus status;
  final ScannerLoadStatus scanLoading;
  final ElderlyProfileModel elderlyProfile;
  final ScanStatus scanStatus;
  final LogoutStatus logoutStatus;
  final String fullAddress;

  UserProfileState copyWith(
      {RegisterModel? userProfile,
      UserProfileStatus? status,
      ScannerLoadStatus? scanLoading,
      ElderlyProfileModel? elderlyProfile,
      ScanStatus? scanStatus,
      LogoutStatus? logoutStatus,
      String? fullAddress}) {
    return UserProfileState(
        userProfile: userProfile ?? this.userProfile,
        status: status ?? this.status,
        scanLoading: scanLoading ?? this.scanLoading,
        elderlyProfile: elderlyProfile ?? this.elderlyProfile,
        scanStatus: scanStatus ?? this.scanStatus,
        logoutStatus: logoutStatus ?? this.logoutStatus,
        fullAddress: fullAddress ?? this.fullAddress);
  }

  @override
  List<Object> get props => [
        userProfile,
        status,
        scanLoading,
        elderlyProfile,
        logoutStatus,
        fullAddress
      ];
}

enum UserProfileStatus { initial, loading, success, fail }

enum ScannerLoadStatus { loading, done }

enum ScanStatus { initial, fail, success }

enum LogoutStatus { initial, loading, success, fail }

class UserProfileInitial extends UserProfileState {}
