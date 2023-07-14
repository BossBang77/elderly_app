part of 'volunteer_address_bloc.dart';

abstract class VolunteerAddressEvent extends Equatable {
  const VolunteerAddressEvent();

  @override
  List<Object> get props => [];
}

class InitialData extends VolunteerAddressEvent {
  final RegisterModel profile;
  const InitialData({required this.profile});

  @override
  List<Object> get props => [profile];
}

class EditOrAddForm extends VolunteerAddressEvent {
  final RegisterModel profile;
  final AddressType type;
  const EditOrAddForm({required this.profile, required this.type});

  @override
  List<Object> get props => [profile, type];
}

class ChangeSection extends VolunteerAddressEvent {
  final VoluteerAddressSection section;
  const ChangeSection({required this.section});
  @override
  List<Object> get props => [section];
}

class ChangeForm extends VolunteerAddressEvent {
  final TypeAddress fillType;
  final dynamic value;
  const ChangeForm({required this.fillType, this.value = ''});
  @override
  List<Object> get props => [fillType, value];
}

class SubmitForm extends VolunteerAddressEvent {
  const SubmitForm();
}

class ResetSubmitForm extends VolunteerAddressEvent {
  const ResetSubmitForm();
}

class ConfirmAddress extends VolunteerAddressEvent {
  const ConfirmAddress();
}
