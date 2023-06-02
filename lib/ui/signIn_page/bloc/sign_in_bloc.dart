import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:health_application/repository/login_repos.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/signIn_page/model/login_model.dart';
import 'package:health_application/ui/signIn_page/model/sign_in_model.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {}
  final LoginRepository _loginRepository = LoginRepository();
  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is Initial) {
      yield state.copyWith(
          view: SectionView.login, signInStatus: SignInStatus.initial);
    }

    if (event is ChangeSection) {
      yield state.copyWith(view: event.view);
    }

    if (event is UpdatePassword) {
      SignInModel signIn = state.signIn;
      signIn = signIn.copyWith(password: event.password);
      yield state.copyWith(signIn: signIn);
    }
    if (event is UpdateUsername) {
      SignInModel signIn = state.signIn;
      signIn = signIn.copyWith(username: event.username);
      yield state.copyWith(signIn: signIn);
    }
    if (event is SubmitLogin) {
      var submit = await _loginRepository.login(state.signIn);
      yield* submit.fold((Failure error) async* {
        yield state.copyWith(
            signInStatus: SignInStatus.fail, loginRes: LoginModel());
      }, (LoginModel res) async* {
        yield state.copyWith(signInStatus: SignInStatus.success, loginRes: res);
      });
    }
    if (event is ObscurePassword) {
      yield state.copyWith(obscurePassword: !state.obscurePassword);
    }
  }
}
