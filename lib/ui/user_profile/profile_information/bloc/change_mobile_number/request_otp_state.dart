import 'package:equatable/equatable.dart';
import 'package:health_application/ui/user_profile/model/response/request_otp_response.dart';

class RequestOtpState extends Equatable {
  const RequestOtpState(
      {this.phoneNumber = '',
      this.countDownTime = '',
      this.otp = '',
      this.requestOtpState = RequestingState.initial,
      this.phoneNumberSubmitState = PhoneNumberSubmitState.initial,
      this.displayState = RequestOtpDisplayState.phoneSubmission,
      this.requestOtpResponse = const RequestOtpResponse()});
  final String phoneNumber;
  final String countDownTime;
  final String otp;
  final RequestingState requestOtpState;
  final PhoneNumberSubmitState phoneNumberSubmitState;
  final RequestOtpDisplayState displayState;
  final RequestOtpResponse requestOtpResponse;

  @override
  List<Object?> get props => [
        phoneNumber,
        countDownTime,
        otp,
        requestOtpState,
        PhoneNumberSubmitState,
        requestOtpResponse,
        displayState,
        phoneNumberSubmitState
      ];

  RequestOtpState copyWith(
      {String? phoneNumber,
      String? countDownTime,
      String? otp,
      RequestingState? requestOtpState,
      PhoneNumberSubmitState? phoneNumberSubmitState,
      RequestOtpDisplayState? displayState,
      RequestOtpResponse? requestOtpResponse}) {
    return RequestOtpState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        countDownTime: countDownTime ?? this.countDownTime,
        otp: otp ?? this.otp,
        requestOtpState: requestOtpState ?? this.requestOtpState,
        phoneNumberSubmitState:
            phoneNumberSubmitState ?? this.phoneNumberSubmitState,
        displayState: displayState ?? this.displayState,
        requestOtpResponse: requestOtpResponse ?? this.requestOtpResponse);
  }
}

enum RequestingState { initial, requesting, timeout, failure, success }

enum PhoneNumberSubmitState { initial, requesting, failure, success }

enum RequestOtpDisplayState { phoneSubmission, optSubmission }
