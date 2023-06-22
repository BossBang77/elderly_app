part of 'personal_medication_bloc.dart';

class PersonalMedicationState extends Equatable {
  const PersonalMedicationState(
      {this.pageView = PageViewMedication.summaryPage});

  final PageViewMedication pageView;

  PersonalMedicationState copyWith({PageViewMedication? pageView}) {
    return PersonalMedicationState(pageView: pageView ?? this.pageView);
  }

  @override
  List<Object> get props => [pageView];
}

class PersonalMedicationInitial extends PersonalMedicationState {}

enum PageViewMedication { summaryPage, medicationDetail }
