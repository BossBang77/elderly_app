part of 'personal_medication_bloc.dart';

class PersonalMedicationEvent extends Equatable {
  const PersonalMedicationEvent();

  @override
  List<Object> get props => [];
}

class ChangeView extends PersonalMedicationEvent {
  final PageViewMedication viewMedication;
  const ChangeView({this.viewMedication = PageViewMedication.summaryPage});
}

class InitialValue extends PersonalMedicationEvent {
  const InitialValue();
}

class DeleteMedcation extends PersonalMedicationEvent {
  final String id;
  const DeleteMedcation({required this.id});
  @override
  List<Object> get props => [id];
}

class ResetSubmitState extends PersonalMedicationEvent {
  const ResetSubmitState();
}

class CreateFormMedication extends PersonalMedicationEvent {
  const CreateFormMedication();
}

class UpdateFormMedication extends PersonalMedicationEvent {
  final MedicationDetailModel currentMedication;
  const UpdateFormMedication({required this.currentMedication});
  @override
  List<Object> get props => [currentMedication];
}

class ChangeDetailMedication extends PersonalMedicationEvent {
  final MedicationChange type;
  final String code;
  final dynamic value;
  const ChangeDetailMedication(
      {required this.type, this.code = '', this.value});
  @override
  List<Object> get props => [type, code, value];
}

class SubmitMedication extends PersonalMedicationEvent {
  const SubmitMedication();
}
