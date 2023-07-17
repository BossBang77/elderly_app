import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/volunteer_home_repos.dart';
import 'package:health_application/repository/logout_repos.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/base/model/status_code.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/register_profile/model/addresses_detail.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/register_profile/volunteer/model/elderly_profile_model.dart';
import 'package:health_application/ui/register_profile/volunteer/model/elderly_profile_response.dart';

import '../../../repository/login_repos.dart';
import '../../volunteer/volunteer_address/bloc/volunteer_address_bloc.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final LoginRepository _loginRepository = LoginRepository();
  final VolunteerHomeRepository _volunteerHomeRepository =
      VolunteerHomeRepository();

  final LogoutRepository _logoutRepository = LogoutRepository();
  UserProfileBloc() : super(UserProfileInitial()) {}

  @override
  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    if (event is GetUserProfile) {
      yield state.copyWith(status: UserProfileStatus.loading);
      var userProfile = await _loginRepository.getPfofile();
      yield* userProfile.fold((Failure error) async* {
        yield state.copyWith(
            userProfile: RegisterModel(),
            status: UserProfileStatus.fail,
            fullAddress: '');
      }, (RegisterModel res) async* {
        var role = await UserSecureStorage().getRole();
        RegisterModel profile = res;
        profile =
            profile.copyWith(role: role.isNotEmpty ? role.first.role : '');
        String fullAddress = profile.addresses
            .firstWhere(
              (element) => element.type == AddressType.CONTACT_ADDRESS.name,
              orElse: () => AddressDetailModel(),
            )
            .fullAddressWithPrefix;
        yield state.copyWith(
            userProfile: profile,
            status: UserProfileStatus.success,
            fullAddress: fullAddress);
      });
    } else if (event is UserProfileLoggedOut) {
      final response = await _logoutRepository.sendLogout();
      yield* response.fold((error) async* {
        yield state.copyWith(logoutStatus: LogoutStatus.fail);
      }, (response) async* {
        if (response == StatusCode.success) {
          yield state.copyWith(logoutStatus: LogoutStatus.success);
        }
      });
    } else if (event is UserProfileInitialLogoutState) {
      yield state.copyWith(logoutStatus: LogoutStatus.initial);
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

    if (event is IntitalLogoutStatus) {
      yield state.copyWith(logoutStatus: LogoutStatus.initial);
    }
  }
}
