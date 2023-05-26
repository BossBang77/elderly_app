import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {}

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is Initial) {
      yield state.copyWith(view: SectionView.login);
    }
    if (event is ChangeSection) {
      yield state.copyWith(view: event.view);
    }
  }
}
