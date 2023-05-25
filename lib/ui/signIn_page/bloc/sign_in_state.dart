part of 'sign_in_bloc.dart';

enum SectionView { login, forgotPassword, vertifyOTP, resetPassword }

class SignInState extends Equatable {
  const SignInState({this.view = SectionView.login});

  final SectionView view;
  const SignInState.initial() : this();
  SignInState copyWith({
    SectionView? view,
  }) {
    return SignInState(view: view ?? this.view);
  }

  @override
  List<Object> get props => [view];
}
