part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  const UserProfileState(
      {this.userProfile = const RegisterModel(),
      this.status = UserProfileStatus.initial});

  final RegisterModel userProfile;
  final UserProfileStatus status;

  UserProfileState copyWith(
      {RegisterModel? userProfile, UserProfileStatus? status}) {
    return UserProfileState(
        userProfile: userProfile ?? this.userProfile,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [userProfile, status];
}

enum UserProfileStatus { initial, loading, success, fail }

class UserProfileInitial extends UserProfileState {}
