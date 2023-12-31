part of 'elderly_setting_bloc.dart';

class ElderlySettingEvent extends Equatable {
  const ElderlySettingEvent();

  @override
  List<Object> get props => [];
}

class SettingLanguage extends ElderlySettingEvent {
  const SettingLanguage();
}

class DeleteAccount extends ElderlySettingEvent {
  const DeleteAccount();
}

class GetVersionApp extends ElderlySettingEvent {
  const GetVersionApp();
}

class ResetDeleteStatus extends ElderlySettingEvent {
  const ResetDeleteStatus();
}
