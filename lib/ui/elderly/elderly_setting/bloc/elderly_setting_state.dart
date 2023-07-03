part of 'elderly_setting_bloc.dart';

class ElderlySettingState extends Equatable {
  const ElderlySettingState(
      {this.pageView = PageViewType.summary,
      this.deleteStatus = DeleteStatus.initial,
      this.isLoading = false,
      this.appVersion = ''});

  final PageViewType pageView;
  final DeleteStatus deleteStatus;
  final bool isLoading;
  final String appVersion;

  ElderlySettingState copyWith(
      {PageViewType? pageView,
      DeleteStatus? deleteStatus,
      bool? isLoading,
      String? appVersion}) {
    return ElderlySettingState(
        pageView: pageView ?? this.pageView,
        deleteStatus: deleteStatus ?? this.deleteStatus,
        isLoading: isLoading ?? this.isLoading,
        appVersion: appVersion ?? this.appVersion);
  }

  @override
  List<Object> get props => [pageView, deleteStatus, isLoading, appVersion];
}

class ElderlySettingInitial extends ElderlySettingState {}

enum PageViewType {
  summary,
  language,
  delete,
  about,
}

enum DeleteStatus {
  initial,
  success,
  fail,
}
