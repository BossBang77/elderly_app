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
  const UpdateValue({required this.type, required this.value});

  final FormFieldType type;
  final String value;
}

class ObscurePassword extends VolunteerRegisterEvent {
  const ObscurePassword();
}

class RegisterProfile extends VolunteerRegisterEvent {
  const RegisterProfile();
}

class DefaultStatus extends VolunteerRegisterEvent {
  const DefaultStatus();
}
