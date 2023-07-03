import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../repository/login_repos.dart';

part 'elderly_setting_event.dart';
part 'elderly_setting_state.dart';

class ElderlySettingBloc
    extends Bloc<ElderlySettingEvent, ElderlySettingState> {
  ElderlySettingBloc() : super(ElderlySettingInitial()) {}
  LoginRepository _loginRepository = LoginRepository();
  @override
  Stream<ElderlySettingState> mapEventToState(
      ElderlySettingEvent event) async* {
    if (event is GetVersionApp) {
      yield state.copyWith(isLoading: true);
      await getAppVersion();
    }

    if (event is DeleteAccount) {
      yield state.copyWith(isLoading: true);
      var delUser = await _loginRepository.deleteUser();

      yield* delUser.fold((err) async* {
        yield state.copyWith(deleteStatus: DeleteStatus.fail, isLoading: false);
      }, (res) async* {
        yield state.copyWith(
            deleteStatus: DeleteStatus.success, isLoading: false);
      });
    }

    if (event is ResetDeleteStatus) {
      yield state.copyWith(deleteStatus: DeleteStatus.initial);
    }
  }

  Future<void> getAppVersion() async {
    String version = '';
    String buildNumber = '';
    String appVersion = '';
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
      appVersion = '$version ($buildNumber)';
      emit(state.copyWith(appVersion: appVersion, isLoading: false));
    });
  }
}
