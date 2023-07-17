import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/register_repos.dart';
import 'package:health_application/ui/google_map/googlemap.dart';
import 'package:health_application/ui/signIn_page/forgot_password/model/request_submit_new_password.dart';
import 'package:health_application/ui/signIn_page/forgot_password/model/verify_reset_password.dart';
import 'package:health_application/ui/user_profile/model/response/request_otp_response.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  RegisterRepository _registerRepository = RegisterRepository();
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    Timer? _timer;
    int _countDownTimer = 0;

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

    void checkCancleTimer() {
      if (_timer!.isActive) {
        _timer?.cancel();
      }
    }

    String formatedTime({required int timeInSecond}) {
      int sec = timeInSecond % 60;
      int min = (timeInSecond / 60).floor();
      String minute = min.toString().length <= 1 ? "0$min" : "$min";
      String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
      return "$minute : $second";
    }

    void _onRequestOtpTimerUpdated(
        RequestOtpTimerUpdated event, Emitter<ForgotPasswordState> emit) async {
      if (_countDownTimer > 0) {
        _countDownTimer--;
        final formattedTime = formatedTime(timeInSecond: _countDownTimer);
        emit(state.copyWith(
            countDownTime: formattedTime,
            requestOtpState: RequestingOTPState.requesting));
      } else {
        _timer?.cancel();
        emit(state.copyWith(requestOtpState: RequestingOTPState.timeout));
      }
    }

    on<ForgotPasswordEvent>((event, emit) async {
      if (event is InitialData) {
        emit(ForgotPasswordState.initial());
      }

      if (event is CheckPhoneNumber) {
        var checkExisting =
            await _registerRepository.checkExisting(event.phoneNumber);
        checkExisting.fold((err) {
          emit(state.copyWith(isExisting: ExistingStatus.isExisting));
        }, (res) {
          emit(state.copyWith(isExisting: ExistingStatus.isNew));
        });
      }

      if (event is InputPhoneNumber) {
        emit(state.copyWith(
            phone: event.phone, isExisting: ExistingStatus.initial));
      }

      if (event is RequestPasswordReset) {
        emit(state.copyWith(isLoading: true));
        var requestResetPassword =
            await _registerRepository.requestResetPassword(state.phone);

        requestResetPassword.fold((err) {
          emit(state.copyWith(
              requestResetStatus: RequestResetPassword.requestFail,
              requestOtpResponse: RequestOtpResponse(),
              isLoading: false));
        }, (res) {
          emit(state.copyWith(
              requestResetStatus: RequestResetPassword.requestSuccess,
              requestOtpResponse: res,
              isLoading: false));
          _setTimer();
        });
      }

      if (event is RequestOtpTimerUpdated) {
        _onRequestOtpTimerUpdated(event, emit);
      }

      if (event is RequestResetStatus) {
        emit(state.copyWith(requestResetStatus: RequestResetPassword.initial));
      }

      if (event is InputOtpVerify) {
        emit(state.copyWith(
            otpVerify: event.otp, verifyStatus: VerifyStatus.initial));
      }

      if (event is VertifyResetPasswordState) {
        var verifyRes = await _registerRepository
            .verifyResetPassword(event.verifyRequestBody);

        verifyRes.fold((err) {
          emit(state.copyWith(
              resetPasswordToken: '', verifyStatus: VerifyStatus.fail));
        }, (res) {
          checkCancleTimer();
          emit(state.copyWith(
              resetPasswordToken: res.resetPasswordToken,
              verifyStatus: VerifyStatus.success));
        });
      }

      if (event is ObscureConfimPassword) {
        emit(state.copyWith(obscureConfirmPassword: event.isHide));
      }

      if (event is ObscureNewPassword) {
        emit(state.copyWith(obscureNewPassword: event.isHide));
      }

      if (event is InputConfimPassword) {
        emit(state.copyWith(confirmPassword: event.password));
      }

      if (event is InputNewPassword) {
        emit(state.copyWith(newPassword: event.password));
      }

      if (event is SubmitResetPassword) {
        emit(state.copyWith(isLoading: true));
        var submitRes =
            await _registerRepository.submitResetPassword(event.submitMol);
        submitRes.fold((err) {
          emit(state.copyWith(
              submitResetPasswordStatus: SubmitResetPasswordStatus.success,
              isLoading: false));
        }, (res) {
          _timer?.cancel;
          emit(state.copyWith(
              submitResetPasswordStatus: SubmitResetPasswordStatus.success,
              isLoading: false));
        });
      }

      if (event is ResetVerifyStatus) {
        emit(state.copyWith(verifyStatus: VerifyStatus.initial));
      }

      if (event is ResetSubmitStatus) {
        emit(state.copyWith(
            submitResetPasswordStatus: SubmitResetPasswordStatus.initial));
      }
    });
  }
}
