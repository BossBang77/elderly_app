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

  void setEnv(AppConfig appConfig) {
    _appConfig = appConfig;
    _currentEnv = appConfig.envPath;
    _currentUsernameAuth = appConfig.getusernameAuth;
    _currentPasswordAuth = appConfig.passwordAuth;
  }
}
