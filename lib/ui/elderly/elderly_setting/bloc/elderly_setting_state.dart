part of 'elderly_setting_bloc.dart';

class ElderlySettingState extends Equatable {
  const ElderlySettingState({
    this.pageView = PageViewType.summary,
    this.deleteStatus = DeleteStatus.initial,
  });

  final PageViewType pageView;
  final DeleteStatus deleteStatus;

  ElderlySettingState copyWith({
    PageViewType? pageView,
    DeleteStatus? deleteStatus,
  }) {
    return ElderlySettingState(
      pageView: pageView ?? this.pageView,
      deleteStatus: deleteStatus ?? this.deleteStatus,
    );
  }

  @override
  List<Object> get props => [pageView, deleteStatus];
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
