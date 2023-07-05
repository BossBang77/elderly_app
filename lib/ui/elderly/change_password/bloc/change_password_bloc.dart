import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/ui/base/model/status_code.dart';
import 'package:health_application/ui/elderly/change_password/model/request_change_password.dart';

import '../../../../repository/login_repos.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitial()) {}
  LoginRepository _loginRepository = LoginRepository();
  @override
  Stream<ChangePasswordState> mapEventToState(
      ChangePasswordEvent event) async* {
    if (event is ChangeNewPassword) {
      yield state.copyWith(newPassword: event.newPassword);
    }
    if (event is ChangeOldPassword) {
      yield state.copyWith(
          oldPassword: event.oldPassword, oldPasswordWrong: false);
    }
    if (event is ChangeConfirmPassword) {
      yield state.copyWith(confirmPassword: event.confirmPassword);
    }

    if (event is ObscureNewPassword) {
      yield state.copyWith(obscureNewPassword: !state.obscureNewPassword);
    }
    if (event is ObscureOldPassword) {
      yield state.copyWith(obscureOldPassword: !state.obscureOldPassword);
    }
    if (event is ObscureConfirmPassword) {
      yield state.copyWith(
          obscureConfirmPassword: !state.obscureConfirmPassword);
    }

    if (event is ResetChangeStatus) {
      yield state.copyWith(status: ChangePasswordStatus.initial);
    }

    if (event is SubmitChangePassword) {
      yield state.copyWith(isLoading: true);
      RequestChangePassword body = RequestChangePassword(
          oldPassword: state.oldPassword,
          newPassword: state.newPassword,
          confirmPassword: state.confirmPassword);
      var submitChangePassword = await _loginRepository.changePassword(body);
      yield* submitChangePassword.fold((error) async* {
        yield state.copyWith(
            isLoading: false, status: ChangePasswordStatus.changeFail);
      }, (int res) async* {
        if (res == StatusCode.unauthorized) {
          yield state.copyWith(isLoading: false, oldPasswordWrong: true);
        } else {
          yield state.copyWith(
              isLoading: false, status: ChangePasswordStatus.changeSuccess);
        }
      });
    }
  }
}
