import 'package:equatable/equatable.dart';

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
