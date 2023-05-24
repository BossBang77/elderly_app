import 'package:flutter/material.dart';

import 'app_config.dart';

class AppConfigDev implements AppConfig {
  final _appName = "Road safety";

  @override
  String get appName => _appName;

  @override
  // TODO: implement envPath
  String get envPath => 'http://128.199.82.75:8081';

  @override
  // TODO: implement getusernameAuth
  String get getusernameAuth => 'road-safety-dev-client';

  @override
  // TODO: implement passwordAuth
  String get passwordAuth => 'WsUm3jA2WNRsQZyAEVCWxfaDu';
}
