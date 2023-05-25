part of 'register_profile_bloc.dart';

abstract class RegisterProfileEvent extends Equatable {
  const RegisterProfileEvent();

  @override
  List<Object> get props => [];
}

class ChangeProfileView extends RegisterProfileEvent {
  final ProfileType profileType;
  const ChangeProfileView({required this.profileType});
  @override
  List<Object> get props => [profileType];
}

class SelectRole extends RegisterProfileEvent {
  final RoleType roleType;
  const SelectRole({this.roleType = RoleType.initial});
  @override
  List<Object> get props => [roleType];
}

class SelectGender extends RegisterProfileEvent {
  final Gender gender;
  const SelectGender({this.gender = Gender.initial});
  @override
  List<Object> get props => [gender];
}

class ForwardBMIDetail extends RegisterProfileEvent {
  const ForwardBMIDetail();
  @override
  List<Object> get props => [];
}

class BackwardBMIDetail extends RegisterProfileEvent {
  const BackwardBMIDetail();
  @override
  List<Object> get props => [];
}
