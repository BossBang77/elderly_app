import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/app_config/app_config.dart';
import 'package:health_application/ui/base/app_config/app_config_dev.dart';
import 'package:health_application/ui/base/app_config/conflig.dart';

import 'main.dart';

void main() {
  final AppConfig appConfig = AppConfigDev();
  ConfigEnv().setEnv(appConfig);
  Bloc.observer = CounterObserver();
  runApp(MyApp());
}
