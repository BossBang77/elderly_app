part of 'change_password_bloc.dart';

class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class ChangeNewPassword extends ChangePasswordEvent {
  final String newPassword;

  const ChangeNewPassword({this.newPassword = ''});
}

class ChangeOldPassword extends ChangePasswordEvent {
  final String oldPassword;

  const ChangeOldPassword({this.oldPassword = ''});
}

class ChangeConfirmPassword extends ChangePasswordEvent {
  final String confirmPassword;

  const ChangeConfirmPassword({this.confirmPassword = ''});
}

class SubmitChangePassword extends ChangePasswordEvent {
  const SubmitChangePassword();
}

class ObscureNewPassword extends ChangePasswordEvent {
  const ObscureNewPassword();
}

class ObscureOldPassword extends ChangePasswordEvent {
  const ObscureOldPassword();
}

class ObscureConfirmPassword extends ChangePasswordEvent {
  const ObscureConfirmPassword();
}

class ResetChangeStatus extends ChangePasswordEvent {
  const ResetChangeStatus();
}
