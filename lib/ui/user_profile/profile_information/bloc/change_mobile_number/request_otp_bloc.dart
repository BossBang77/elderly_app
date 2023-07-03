import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/user_profile/model/response/request_otp_response.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_event.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_state.dart';

import '../../../../../repository/request_otp_repos.dart';

class RequestOtpBloc extends Bloc<RequestOtpEvent, RequestOtpState> {
  RequestOtpBloc() : super(RequestOtpState()) {
    on<RequestOtpOtpValueChanged>(_onRequestOtpOtpValueChanged); // กรอกรหัส otp
    on<RequestOtpPhoneNumberValueChanged>(
        _RequestOtpPhoneNumberValueChanged); // กรอกเบอร์โทร
    on<RequestOtpSendOtpConfirmation>(_onRequestOtpSendOtpConfirmation); //
    on<RequestOtpSendOtpRequest>(_onRequestOtpSendOtpRequest); // ขอรหัส OTP
    on<RequestOtpTimerUpdated>(_onRequestOtpTimerUpdated);
    on<ResetRequestOtpState>(_onResetRequestOtpState);
    on<ResetPhoneNumberSubmit>(_onResetPhoneNumberSubmit);
    on<ChangeRequestOtpDisplayState>(_onChangeRequestOtpDisplayState);
  }
  RequestOtpRepository _requestOtpRepository = RequestOtpRepository();
  Timer? _timer;
  int _countDownTimer = 0;

  void _onRequestOtpOtpValueChanged(
      RequestOtpOtpValueChanged event, Emitter<RequestOtpState> emit) {
    emit(state.copyWith(otp: event.value));
  }

  void _RequestOtpPhoneNumberValueChanged(
      RequestOtpPhoneNumberValueChanged event, Emitter<RequestOtpState> emit) {
    emit(state.copyWith(phoneNumber: event.value));
  }

  void _onRequestOtpSendOtpConfirmation(RequestOtpSendOtpConfirmation event,
      Emitter<RequestOtpState> emit) async {
    var request = await _requestOtpRepository.verifyOtp(
        state.phoneNumber, state.requestOtpResponse.token, state.otp);
    request.fold((err) async {
      emit(state.copyWith(
          phoneNumberSubmitState: PhoneNumberSubmitState.failure));
    }, (res) async {
      emit(state.copyWith(
          phoneNumberSubmitState: PhoneNumberSubmitState.success));
      close();
    });
  }

  Future<void> _onRequestOtpSendOtpRequest(
      RequestOtpSendOtpRequest event, Emitter<RequestOtpState> emit) async {
    var request = await _requestOtpRepository.requestOtp(state.phoneNumber);
    request.fold((err) async {
      emit(state.copyWith(
          requestOtpResponse: RequestOtpResponse(),
          requestOtpState: RequestingState.failure));
    }, (res) async {
      emit(state.copyWith(
          requestOtpResponse: res,
          displayState: RequestOtpDisplayState.optSubmission,
          requestOtpState: RequestingState.requesting));
      _setTimer();
    });
  }

  Future<void> _setTimer() async {
    _countDownTimer = 30;
    add(RequestOtpTimerUpdated());
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      add(RequestOtpTimerUpdated());
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  String formatedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  void _onRequestOtpTimerUpdated(
      RequestOtpTimerUpdated event, Emitter<RequestOtpState> emit) async {
    if (_countDownTimer > 0) {
      _countDownTimer--;
      final formattedTime = formatedTime(timeInSecond: _countDownTimer);
      emit(state.copyWith(countDownTime: formattedTime));
    } else {
      _timer?.cancel();
      emit(state.copyWith(requestOtpState: RequestingState.timeout));
    }
  }

  Future<void> _onResetRequestOtpState(
      ResetRequestOtpState event, Emitter<RequestOtpState> emit) async {
    emit(state.copyWith(requestOtpState: RequestingState.initial));
  }

  Future<void> _onResetPhoneNumberSubmit(
      ResetPhoneNumberSubmit event, Emitter<RequestOtpState> emit) async {
    emit(
        state.copyWith(phoneNumberSubmitState: PhoneNumberSubmitState.initial));
  }

  Future<void> _onChangeRequestOtpDisplayState(
      ChangeRequestOtpDisplayState event, Emitter<RequestOtpState> emit) async {
    emit(state.copyWith(displayState: event.state));
  }
}
