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

class FormFillType extends RegisterProfileEvent {
  final dynamic value;
  final int index;
  final FillType type;
  const FormFillType({this.value = null, this.index = 0, required this.type});
  @override
  List<Object> get props => [value, index, type];
}

class CalculateBMI extends RegisterProfileEvent {
  const CalculateBMI();
  @override
  List<Object> get props => [];
}

class SubmitRegister extends RegisterProfileEvent {
  const SubmitRegister();
  @override
  List<Object> get props => [];
}

class ObscurePassword extends RegisterProfileEvent {
  const ObscurePassword();
}

class InitialStatus extends RegisterProfileEvent {
  const InitialStatus();
}
