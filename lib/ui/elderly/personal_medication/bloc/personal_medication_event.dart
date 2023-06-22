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
