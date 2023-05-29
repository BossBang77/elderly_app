import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_profile_event.dart';
part 'register_profile_state.dart';

class RegisterProfileBloc
    extends Bloc<RegisterProfileEvent, RegisterProfileState> {
  RegisterProfileBloc() : super(RegisterProfileInitial()) {}
  @override
  Stream<RegisterProfileState> mapEventToState(
      RegisterProfileEvent event) async* {
    if (event is SelectRole) {
      yield state.copyWith(roleType: event.roleType);
    }
    if (event is ChangeProfileView) {
      yield state.copyWith(profileType: event.profileType);
    }
    if (event is SelectGender) {
      yield state.copyWith(gender: event.gender);
    }
    if (event is ForwardBMIDetail) {
      if (state.bmiDetail.index + 1 < BMIDetail.values.length) {
        yield state.copyWith(
            bmiDetail: BMIDetail.values[state.bmiDetail.index + 1]);
      } else {}
    }

    if (event is BackwardBMIDetail) {
      if (state.bmiDetail.index - 1 >= 0) {
        yield state.copyWith(
            bmiDetail: BMIDetail.values[state.bmiDetail.index - 1]);
      } else {}
    }
  }
}
