part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class GetUserProfile extends UserProfileEvent {
  const GetUserProfile();
}

class UserProfileLoggedOut extends UserProfileEvent {}

class UserProfileInitialLogoutState extends UserProfileEvent {}