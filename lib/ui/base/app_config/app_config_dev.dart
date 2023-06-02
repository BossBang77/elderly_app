import 'package:flutter/material.dart';

import 'app_config.dart';

class AppConfigDev implements AppConfig {
  final _appName = "Elderly_DEV";

  @override
  String get appName => _appName;

  @override
  // TODO: implement envPath
  String get envPath => 'http://159.65.10.251';

  @override
  // TODO: implement getusernameAuth
  String get getusernameAuth => 'elderly-dev-client';

  @override
  // TODO: implement passwordAuth
  String get passwordAuth => 'WsUm3jA2WNRsQZyAEVCWxfaDu';
}
