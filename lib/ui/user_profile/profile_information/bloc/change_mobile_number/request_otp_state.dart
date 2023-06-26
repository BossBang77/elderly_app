import 'package:equatable/equatable.dart';

class RequestOtpState extends Equatable {
  const RequestOtpState({
    this.phoneNumber = '',
    this.countDownTime = '',
    this.otp = '',
    this.requestOtpState = RequestingState.initial,
    this.phoneNumberSubmitState = PhoneNumberSubmitState.initial,
    this.displayState = RequestOtpDisplayState.phoneSubmission
  });
  final String phoneNumber;
  final String countDownTime;
  final String otp;
  final RequestingState requestOtpState;
  final PhoneNumberSubmitState phoneNumberSubmitState;
  final RequestOtpDisplayState displayState;
  
  @override
  List<Object?> get props => [
    phoneNumber,
    countDownTime,
    otp,
    requestOtpState,
    PhoneNumberSubmitState,
    displayState
  ];

  RequestOtpState copyWith({
    String? phoneNumber,
    String? countDownTime,
    String? otp,
    RequestingState? requestOtpState,
    PhoneNumberSubmitState? phoneNumberSubmitState,
    RequestOtpDisplayState? displayState
  }) {
    return RequestOtpState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countDownTime: countDownTime ?? this.countDownTime,
      otp: otp ?? this.otp,
      requestOtpState: requestOtpState ?? this.requestOtpState,
      phoneNumberSubmitState: phoneNumberSubmitState ?? this.phoneNumberSubmitState,
      displayState: displayState ?? this.displayState
    );
  }
}

enum RequestingState { initial, requesting, timeout, failure, success }

enum PhoneNumberSubmitState { initial, requesting, failure, success }

enum RequestOtpDisplayState { phoneSubmission, optSubmission }