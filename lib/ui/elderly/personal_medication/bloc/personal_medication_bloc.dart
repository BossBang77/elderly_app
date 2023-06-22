import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'personal_medication_event.dart';
part 'personal_medication_state.dart';

class PersonalMedicationBloc
    extends Bloc<PersonalMedicationEvent, PersonalMedicationState> {
  PersonalMedicationBloc() : super(PersonalMedicationInitial()) {}
  @override
  Stream<PersonalMedicationState> mapEventToState(
      PersonalMedicationEvent event) async* {
    if (event is ChangeView) {
      yield state.copyWith(pageView: event.viewMedication);
    }
  }
}

void addEvent(BuildContext context, PersonalMedicationEvent event) {
  context.read<PersonalMedicationBloc>().add(event);
}
