part of 'volunteer_information_bloc.dart';

abstract class VolunteerInformationEvent extends Equatable {
  const VolunteerInformationEvent();

  @override
  List<Object> get props => [];
}

class InitialData extends VolunteerInformationEvent {
  final RegisterModel profile;
  const InitialData({required this.profile});
}

class ChangeForm extends VolunteerInformationEvent {
  final EditType type;
  final dynamic value;
  const ChangeForm({required this.type, this.value});
}

class UpdateVolunteerInformation extends VolunteerInformationEvent {
  const UpdateVolunteerInformation();
}

class ResetStatusUpdate extends VolunteerInformationEvent {
  const ResetStatusUpdate();
}
