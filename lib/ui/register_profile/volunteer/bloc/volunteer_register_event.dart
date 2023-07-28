part of 'volunteer_register_bloc.dart';

abstract class VolunteerRegisterEvent extends Equatable {
  const VolunteerRegisterEvent();

  @override
  List<Object> get props => [];
}

class InitialForm extends VolunteerRegisterEvent {
  const InitialForm({required this.data});
  final RegisterModel data;
}

class UpdateValue extends VolunteerRegisterEvent {
  const UpdateValue(
      {required this.type, required this.value, this.otherVal = null});

  final FormFieldType type;
  final String value;
  final dynamic otherVal;
}

class RegisterProfile extends VolunteerRegisterEvent {
  const RegisterProfile();
}

class DefaultStatus extends VolunteerRegisterEvent {
  const DefaultStatus();
}

class UploadDocument extends VolunteerRegisterEvent {
  const UploadDocument();
}
