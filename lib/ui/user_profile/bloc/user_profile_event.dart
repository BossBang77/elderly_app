part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class GetUserProfile extends UserProfileEvent {
  const GetUserProfile();
}

class GetDetail extends UserProfileEvent {
  const GetDetail();
}

class getElderlyProfile extends UserProfileEvent {
  const getElderlyProfile({required this.id});

  final String id;
}

class ResetScan extends UserProfileEvent {
  const ResetScan();
}

class IntitalLogoutStatus extends UserProfileEvent {
  const IntitalLogoutStatus();
}

class UserProfileLoggedOut extends UserProfileEvent {}

class UserProfileInitialLogoutState extends UserProfileEvent {}

class UpdateProfile extends UserProfileEvent {
  final RegisterModel profile;
  const UpdateProfile({required this.profile});

  @override
  List<Object> get props => [profile];
}
