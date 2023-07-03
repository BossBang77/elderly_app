import 'package:equatable/equatable.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_state.dart';

abstract class RequestOtpEvent extends Equatable {
  const RequestOtpEvent();
}

class RequestOtpPhoneNumberValueChanged extends RequestOtpEvent {
  const RequestOtpPhoneNumberValueChanged({required this.value});

  final String value;

  @override
  List<Object?> get props => [value];
}

class RequestOtpOtpValueChanged extends RequestOtpEvent {
  const RequestOtpOtpValueChanged({required this.value});

  final String value;

  @override
  List<Object?> get props => [value];
}

class RequestOtpSendOtpRequest extends RequestOtpEvent {
  const RequestOtpSendOtpRequest();
  @override
  List<Object?> get props => [];
}

class RequestOtpSendOtpConfirmation extends RequestOtpEvent {
  const RequestOtpSendOtpConfirmation({required this.otp});

  final String otp;

  @override
  List<Object?> get props => [otp];
}

class RequestOtpTimerUpdated extends RequestOtpEvent {
  @override
  List<Object?> get props => [];
}

class ResetRequestOtpState extends RequestOtpEvent {
  @override
  List<Object?> get props => [];
  const ResetRequestOtpState();
}

class ResetPhoneNumberSubmit extends RequestOtpEvent {
  @override
  List<Object?> get props => [];
  const ResetPhoneNumberSubmit();
}

class ChangeRequestOtpDisplayState extends RequestOtpEvent {
  final RequestOtpDisplayState state;
  const ChangeRequestOtpDisplayState({required this.state});
  @override
  List<Object?> get props => [state];
}
