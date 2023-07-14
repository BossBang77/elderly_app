part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState(
      {this.countDownTime = '',
      this.requestOtpState = RequestingOTPState.initial,
      this.isExisting = ExistingStatus.initial,
      this.phone = '',
      this.requestResetStatus = RequestResetPassword.initial,
      this.isLoading = false,
      this.requestOtpResponse = const RequestOtpResponse(),
      this.resetPasswordToken = '',
      this.otpVerify = '',
      this.verifyStatus = VerifyStatus.initial,
      this.confirmPassword = '',
      this.newPassword = '',
      this.obscureConfirmPassword = true,
      this.obscureNewPassword = true,
      this.submitResetPasswordStatus = SubmitResetPasswordStatus.initial});
  final String countDownTime;
  final RequestingOTPState requestOtpState;
  final ExistingStatus isExisting;
  final String phone;
  final RequestResetPassword requestResetStatus;
  final bool isLoading;
  final RequestOtpResponse requestOtpResponse;
  final String resetPasswordToken;
  final String otpVerify;
  final VerifyStatus verifyStatus;
  final bool obscureNewPassword;
  final bool obscureConfirmPassword;
  final String newPassword;
  final String confirmPassword;
  final SubmitResetPasswordStatus submitResetPasswordStatus;

  const ForgotPasswordState.initial(
      {this.countDownTime = '',
      this.requestOtpState = RequestingOTPState.initial,
      this.isExisting = ExistingStatus.initial,
      this.phone = '',
      this.requestResetStatus = RequestResetPassword.initial,
      this.isLoading = false,
      this.requestOtpResponse = const RequestOtpResponse(),
      this.resetPasswordToken = '',
      this.otpVerify = '',
      this.verifyStatus = VerifyStatus.initial,
      this.confirmPassword = '',
      this.newPassword = '',
      this.obscureConfirmPassword = true,
      this.obscureNewPassword = true,
      this.submitResetPasswordStatus = SubmitResetPasswordStatus.initial});

  ForgotPasswordState copyWith(
      {String? countDownTime,
      RequestingOTPState? requestOtpState,
      ExistingStatus? isExisting,
      String? phone,
      RequestResetPassword? requestResetStatus,
      bool? isLoading,
      RequestOtpResponse? requestOtpResponse,
      String? resetPasswordToken,
      String? otpVerify,
      VerifyStatus? verifyStatus,
      bool? obscureNewPassword,
      bool? obscureConfirmPassword,
      String? newPassword,
      String? confirmPassword,
      SubmitResetPasswordStatus? submitResetPasswordStatus}) {
    return ForgotPasswordState(
        countDownTime: countDownTime ?? this.countDownTime,
        requestOtpState: requestOtpState ?? this.requestOtpState,
        isExisting: isExisting ?? this.isExisting,
        phone: phone ?? this.phone,
        requestResetStatus: requestResetStatus ?? this.requestResetStatus,
        isLoading: isLoading ?? this.isLoading,
        requestOtpResponse: requestOtpResponse ?? this.requestOtpResponse,
        resetPasswordToken: resetPasswordToken ?? this.resetPasswordToken,
        otpVerify: otpVerify ?? this.otpVerify,
        verifyStatus: verifyStatus ?? this.verifyStatus,
        obscureConfirmPassword:
            obscureConfirmPassword ?? this.obscureConfirmPassword,
        obscureNewPassword: obscureNewPassword ?? this.obscureNewPassword,
        newPassword: newPassword ?? this.newPassword,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        submitResetPasswordStatus:
            submitResetPasswordStatus ?? this.submitResetPasswordStatus);
  }

  @override
  List<Object> get props => [
        countDownTime,
        requestOtpState,
        isExisting,
        phone,
        requestResetStatus,
        isLoading,
        requestOtpResponse,
        resetPasswordToken,
        otpVerify,
        verifyStatus,
        newPassword,
        confirmPassword,
        obscureConfirmPassword,
        obscureNewPassword,
        submitResetPasswordStatus
      ];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

enum RequestingOTPState { initial, requesting, timeout, failure, success }

enum ExistingStatus { initial, isExisting, isNew }

enum RequestResetPassword { initial, requestSuccess, requestFail }

enum VerifyStatus { initial, success, fail }

enum SubmitResetPasswordStatus { initial, success, fail }
