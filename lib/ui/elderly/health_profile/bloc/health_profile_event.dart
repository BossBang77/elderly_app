part of 'health_profile_bloc.dart';

class HealthProfileEvent extends Equatable {
  const HealthProfileEvent();

  @override
  List<Object> get props => [];
}

class ChangePageView extends HealthProfileEvent {
  final PageViewWidget pageView;

  const ChangePageView({required this.pageView});
  @override
  List<Object> get props => [pageView];
}

class SetProfile extends HealthProfileEvent {
  final RegisterModel master;
  const SetProfile({this.master = const RegisterModel()});
  @override
  List<Object> get props => [master];
}

class FormFillType extends HealthProfileEvent {
  final dynamic value;
  final int index;
  final FillType type;
  const FormFillType({this.value = null, this.index = 0, required this.type});
  @override
  List<Object> get props => [value, index, type];
}

class SubmitEdit extends HealthProfileEvent {
  const SubmitEdit();
}

class SubmitEditProfile extends HealthProfileEvent {
  const SubmitEditProfile();
}

class ResetStatusUpdate extends HealthProfileEvent {
  const ResetStatusUpdate();
}
