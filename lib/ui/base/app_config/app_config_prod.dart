import 'package:flutter/material.dart';

import 'app_config.dart';

class AppConfigProd implements AppConfig {
  final _appName = "Road safety";

  @override
  String get appName => _appName;

  @override
  // TODO: implement envPath
  String get envPath => 'http://128.199.82.75:8080';

  @override
  // TODO: implement getusernameAuth
  String get getusernameAuth => 'road-safety-prod-client';

  @override
  // TODO: implement passwordAuth
  String get passwordAuth => 'ryNaMK4Vqy26K9HaapWnZd3jG';
}
