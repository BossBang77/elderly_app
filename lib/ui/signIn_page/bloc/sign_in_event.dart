part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class ChangeSection extends SignInEvent {
  final SectionView view;
  const ChangeSection({required this.view});
  List<Object> get props => [view];
}

class Initial extends SignInEvent {
  const Initial();
}

class UpdateUsername extends SignInEvent {
  final String username;
  const UpdateUsername({required this.username});
  @override
  List<Object> get props => [username];
}

class UpdatePassword extends SignInEvent {
  final String password;
  const UpdatePassword({required this.password});
  @override
  List<Object> get props => [password];
}

class SubmitLogin extends SignInEvent {
  const SubmitLogin();
}

class ObscurePassword extends SignInEvent {
  const ObscurePassword();
}
