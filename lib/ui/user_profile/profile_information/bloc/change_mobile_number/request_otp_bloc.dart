import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_event.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_state.dart';

class RequestOtpBloc extends Bloc<RequestOtpEvent, RequestOtpState> {
  RequestOtpBloc(): super(RequestOtpState()) {
    on<RequestOtpOtpValueChanged>(_onRequestOtpOtpValueChanged);
    on<RequestOtpPhoneNumberValueChanged>(_RequestOtpPhoneNumberValueChanged);
    on<RequestOtpSendOtpConfirmation>(_onRequestOtpSendOtpConfirmation);
    on<RequestOtpSendOtpRequest>(_onRequestOtpSendOtpRequest);
    on<RequestOtpTimerUpdated>(_onRequestOtpTimerUpdated);
  }

  Timer? _timer;
  int _countDownTimer = 0;

  void _onRequestOtpOtpValueChanged(
    RequestOtpOtpValueChanged event,
    Emitter<RequestOtpState> emit
  ) {
    emit(state.copyWith(otp: event.value));
  }

  void _RequestOtpPhoneNumberValueChanged(
    RequestOtpPhoneNumberValueChanged event,
    Emitter<RequestOtpState> emit
  ) {
    emit(state.copyWith(phoneNumber: event.value));
  }

  void _onRequestOtpSendOtpConfirmation(
    RequestOtpSendOtpConfirmation event,
    Emitter<RequestOtpState> emit
  ) {
    
  }

  Future<void> _onRequestOtpSendOtpRequest(
    RequestOtpSendOtpRequest event,
    Emitter<RequestOtpState> emit
  ) async {
    emit(state.copyWith(displayState: RequestOtpDisplayState.optSubmission, requestOtpState: RequestingState.requesting));
    _setTimer();
  }

  Future<void> _setTimer() async {
    _countDownTimer = 300;
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
    RequestOtpTimerUpdated event,
    Emitter<RequestOtpState> emit
  ) async {
    if (_countDownTimer > 0) {
      _countDownTimer--;
      final formattedTime = formatedTime(timeInSecond: _countDownTimer);
      emit(state.copyWith(countDownTime: formattedTime));
    } else {
      await close();
      emit(state.copyWith(requestOtpState: RequestingState.timeout));
    }
  }
}
