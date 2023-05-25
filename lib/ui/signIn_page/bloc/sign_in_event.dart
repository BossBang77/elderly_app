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
