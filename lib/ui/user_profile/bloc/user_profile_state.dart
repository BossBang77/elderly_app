part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  const UserProfileState({this.userProfile = const RegisterModel()});

  final RegisterModel userProfile;

  UserProfileState copyWith({RegisterModel? userProfile}) {
    return UserProfileState(userProfile: userProfile ?? this.userProfile);
  }

  @override
  List<Object> get props => [userProfile];
}

class UserProfileInitial extends UserProfileState {}
