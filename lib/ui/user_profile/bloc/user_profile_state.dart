part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  const UserProfileState(
      {this.userProfile = const RegisterModel(),
      this.status = UserProfileStatus.initial,
      this.logoutStatus = LogoutStatus.initial});

  final RegisterModel userProfile;
  final UserProfileStatus status;
  final LogoutStatus logoutStatus;

  UserProfileState copyWith({
    RegisterModel? userProfile, 
    UserProfileStatus? status, 
    LogoutStatus? logoutStatus
  }) {
    return UserProfileState(
        userProfile: userProfile ?? this.userProfile,
        status: status ?? this.status,
        logoutStatus: logoutStatus ?? this.logoutStatus
    );
  }

  @override
  List<Object> get props => [userProfile, status, logoutStatus];
}

enum UserProfileStatus { initial, loading, success, fail }

enum LogoutStatus { initial, loading, success, fail }

class UserProfileInitial extends UserProfileState {}
