part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class RequestOtpTimerUpdated extends ForgotPasswordEvent {
  const RequestOtpTimerUpdated();
}

class CheckPhoneNumber extends ForgotPasswordEvent {
  final String phoneNumber;
  const CheckPhoneNumber({required this.phoneNumber});
  @override
  List<Object> get props => [phoneNumber];
}

class InputPhoneNumber extends ForgotPasswordEvent {
  final String phone;
  const InputPhoneNumber({required this.phone});
  @override
  List<Object> get props => [phone];
}

class InitialData extends ForgotPasswordEvent {
  const InitialData();
}

class RequestPasswordReset extends ForgotPasswordEvent {
  const RequestPasswordReset();
}

class RequestResetStatus extends ForgotPasswordEvent {
  const RequestResetStatus();
}

class VertifyResetPasswordState extends ForgotPasswordEvent {
  final VertifyResetPassword verifyRequestBody;
  const VertifyResetPasswordState({required this.verifyRequestBody});
}

class InputOtpVerify extends ForgotPasswordEvent {
  final String otp;
  const InputOtpVerify({required this.otp});
  @override
  List<Object> get props => [otp];
}

class ObscureNewPassword extends ForgotPasswordEvent {
  final bool isHide;
  const ObscureNewPassword({required this.isHide});

  @override
  List<Object> get props => [isHide];
}

class ObscureConfimPassword extends ForgotPasswordEvent {
  final bool isHide;
  const ObscureConfimPassword({required this.isHide});

  @override
  List<Object> get props => [isHide];
}

class InputConfimPassword extends ForgotPasswordEvent {
  final String password;
  const InputConfimPassword({required this.password});

  @override
  List<Object> get props => [password];
}

class InputNewPassword extends ForgotPasswordEvent {
  final String password;
  const InputNewPassword({required this.password});

  @override
  List<Object> get props => [password];
}

class SubmitResetPassword extends ForgotPasswordEvent {
  final RequestSubmitNewPasswordModel submitMol;
  const SubmitResetPassword({required this.submitMol});

  @override
  List<Object> get props => [submitMol];
}

class ResetVerifyStatus extends ForgotPasswordEvent {
  const ResetVerifyStatus();
}

class ResetSubmitStatus extends ForgotPasswordEvent {
  const ResetSubmitStatus();
}
