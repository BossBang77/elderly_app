import 'package:health_application/ui/base/network_provider.dart';

import 'app_config.dart';
import 'app_config_dev.dart';

class ConfigEnv {
  static String _currentEnv = '';
  static String get currentEnv => _currentEnv;
  static String _currentUsernameAuth = '';
  static String get getusernameAuthCurrent => _currentUsernameAuth;
  static String _currentPasswordAuth = '';
  static String get passwordAuthCurrent => _currentPasswordAuth;
  static AppConfig _appConfig = AppConfigDev();
  static AppConfig get appConfig => _appConfig;
  static NetworkProvider _networkProvider = NetworkProvider();
  static NetworkProvider get networkProvider => _networkProvider;

  void setEnv(AppConfig appConfig) {
    _appConfig = appConfig;
    _currentEnv = appConfig.envPath;
    _currentUsernameAuth = appConfig.getusernameAuth;
    _currentPasswordAuth = appConfig.passwordAuth;
  }
}
