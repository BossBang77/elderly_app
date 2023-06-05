import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';

import '../../../repository/login_repos.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final LoginRepository _loginRepository = LoginRepository();
  UserProfileBloc() : super(UserProfileInitial()) {}

  @override
  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    if (event is GetUserProfile) {
      var userProfile = await _loginRepository.getPfofile();
      yield* userProfile.fold((Failure error) async* {
        yield state.copyWith(userProfile: RegisterModel());
      }, (RegisterModel res) async* {
        yield state.copyWith(userProfile: res);
      });
    }
  }
}
