part of 'sign_in_bloc.dart';

enum SectionView { login, forgotPassword, vertifyOTP, resetPassword }

enum SignInStatus { initial, loading, success, fail }

class SignInState extends Equatable {
  const SignInState(
      {this.view = SectionView.login,
      this.signIn = const SignInModel(),
      this.signInStatus = SignInStatus.initial,
      this.loginRes = const LoginModel(),
      this.obscurePassword = true});

  final SectionView view;
  final SignInModel signIn;
  final SignInStatus signInStatus;
  final LoginModel loginRes;
  final bool obscurePassword;

  const SignInState.initial() : this();
  SignInState copyWith(
      {SectionView? view,
      SignInModel? signIn,
      SignInStatus? signInStatus,
      LoginModel? loginRes,
      bool? obscurePassword}) {
    return SignInState(
        view: view ?? this.view,
        signIn: signIn ?? this.signIn,
        signInStatus: signInStatus ?? this.signInStatus,
        loginRes: loginRes ?? this.loginRes,
        obscurePassword: obscurePassword ?? this.obscurePassword);
  }

  @override
  List<Object> get props =>
      [view, signIn, signInStatus, loginRes, obscurePassword];
}
