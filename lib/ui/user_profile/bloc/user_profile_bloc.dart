import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/volunteer_home_repos.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/register_profile/volunteer/model/elderly_profile_model.dart';
import 'package:health_application/ui/register_profile/volunteer/model/elderly_profile_response.dart';

import '../../../repository/login_repos.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final LoginRepository _loginRepository = LoginRepository();
  final VolunteerHomeRepository _volunteerHomeRepository =
      VolunteerHomeRepository();

  UserProfileBloc() : super(UserProfileInitial()) {}

  @override
  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    if (event is GetUserProfile) {
      yield state.copyWith(status: UserProfileStatus.loading);
      var userProfile = await _loginRepository.getPfofile();
      yield* userProfile.fold((Failure error) async* {
        yield state.copyWith(
            userProfile: RegisterModel(), status: UserProfileStatus.fail);
      }, (RegisterModel res) async* {
        var role = await UserSecureStorage().getRole();
        RegisterModel profile = res;
        profile =
            profile.copyWith(role: role.isNotEmpty ? role.first.role : '');
        yield state.copyWith(
            userProfile: profile, status: UserProfileStatus.success);
      });
    }

    if (event is getElderlyProfile) {
      var key = event.id;
      yield state.copyWith(scanLoading: ScannerLoadStatus.loading);
      var userProfile = await _volunteerHomeRepository.getElderlyProfile(key);
      yield* userProfile.fold((Failure error) async* {
        yield state.copyWith(
            elderlyProfile: ElderlyProfileModel(),
            scanLoading: ScannerLoadStatus.done,
            scanStatus: ScanStatus.fail);
      }, (ElderlyProfileResponse res) async* {
        ElderlyProfileModel profile = res.data;
        yield state.copyWith(
            elderlyProfile: profile,
            scanLoading: ScannerLoadStatus.done,
            scanStatus: ScanStatus.success);
      });
    }

    if (event is ResetScan) {
      yield state.copyWith(scanStatus: ScanStatus.initial);
    }

    if (event is GetDetail) {}
  }
}
