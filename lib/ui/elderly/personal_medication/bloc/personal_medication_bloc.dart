import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:health_application/repository/medication_repos.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/elderly/personal_medication/model/master_medication.dart';
import 'package:health_application/ui/elderly/personal_medication/model/medication_list_model.dart';
import 'package:provider/provider.dart';

import '../model/master_medication_list.dart';
import '../model/medication_detail_model.dart';
import '../model/period_time_model.dart';

part 'personal_medication_event.dart';
part 'personal_medication_state.dart';

class PersonalMedicationBloc
    extends Bloc<PersonalMedicationEvent, PersonalMedicationState> {
  PersonalMedicationBloc() : super(PersonalMedicationInitial()) {}
  MedicationRepository _medicationRepository = MedicationRepository();
  @override
  Stream<PersonalMedicationState> mapEventToState(
      PersonalMedicationEvent event) async* {
    if (event is ChangeView) {
      yield state.copyWith(pageView: event.viewMedication);
    }

    if (event is InitialValue) {
      yield state.copyWith(isLoading: true);
      List<MasterMedicationModel> masterMedicationList = [];
      ListMedicationDetailModel medicationList =
          ListMedicationDetailModel().empty;

      var masterMedication = await _medicationRepository.getMasterMedication();
      var medicationPersonalList =
          await _medicationRepository.getPersonalMedicationList();
      yield* masterMedication.fold((Failure err) async* {
        masterMedicationList = [];
      }, (MasterMedicationListModel res) async* {
        masterMedicationList = res.data;
      });

      yield* medicationPersonalList.fold((Failure err) async* {
        medicationList = ListMedicationDetailModel().empty;
      }, (ListMedicationDetailModel res) async* {
        medicationList = res;
      });

      yield state.copyWith(
          masterMedication: masterMedicationList,
          personalMedicationList: medicationList,
          isLoading: false,
          submitState: SubmitState.initial);
    }
    if (event is DeleteMedcation) {
      var delMedication =
          await _medicationRepository.deleteMedication(event.id);
      yield* delMedication.fold((err) async* {
        yield state.copyWith(submitState: SubmitState.deleteMedicationFail);
      }, (res) async* {
        yield state.copyWith(submitState: SubmitState.deleteMedicationSuccess);
      });
    }

    if (event is ResetSubmitState) {
      yield state.copyWith(submitState: SubmitState.initial);
    }

    if (event is CreateFormMedication) {
      yield state.copyWith(
          modeData: ModeData.CREATE,
          currentMedication: MedicationDetailModel(),
          pageView: PageViewMedication.medicationDetail);
    }
    if (event is UpdateFormMedication) {
      yield state.copyWith(
          modeData: ModeData.UPDATE,
          currentMedication: event.currentMedication,
          pageView: PageViewMedication.medicationDetail);
    }

    if (event is ChangeDetailMedication) {
      yield mapMedicationDetail(event);
    }

    if (event is SubmitMedication) {
      yield state.copyWith(isLoading: true);
      var submitRes;
      if (state.modeData == ModeData.CREATE) {
        submitRes = await _medicationRepository
            .createMedication(state.currentMedication);
      } else {
        submitRes = await _medicationRepository
            .updateMedication(state.currentMedication);
      }
      yield* submitRes.fold((err) async* {
        yield state.copyWith(
            submitState: SubmitState.submitMedicationFail, isLoading: false);
      }, (res) async* {
        yield state.copyWith(
            submitState: SubmitState.submitMedicationSuccess, isLoading: false);
      });
    }
  }

  PersonalMedicationState mapMedicationDetail(ChangeDetailMedication event) {
    var medicationDetail = state.currentMedication;
    var timePeroid = [...medicationDetail.periodTimes];

    switch (event.type) {
      case MedicationChange.drugName:
        medicationDetail = medicationDetail.copyWith(medicationId: event.value);
        break;
      case MedicationChange.dosage:
        medicationDetail = medicationDetail.copyWith(dosage: event.value);
        break;
      case MedicationChange.peroid:
        medicationDetail = medicationDetail.copyWith(periodType: event.value);
        break;
      case MedicationChange.setRepeatNoti:
        medicationDetail =
            medicationDetail.copyWith(isNotificationEveryDay: event.value);
        break;
      case MedicationChange.setDescription:
        medicationDetail = medicationDetail.copyWith(description: event.value);
        break;
      case MedicationChange.addTime:
        PeriodTimeModel periodTime = PeriodTimeModel(code: event.value);
        timePeroid.add(periodTime);
        medicationDetail = medicationDetail.copyWith(periodTimes: timePeroid);
        break;

      case MedicationChange.removeTime:
        timePeroid.removeWhere((time) => time.code == event.code);
        medicationDetail = medicationDetail.copyWith(periodTimes: timePeroid);
        break;

      case MedicationChange.setTimeNoti:
        int index = timePeroid.indexWhere((time) => time.code == event.code);
        if (index >= 0) {
          var master = timePeroid[index];
          if (event.code == TimeOfMedication.OTHER.name) {
            timePeroid[index] = PeriodTimeModel(
                code: master.code,
                notificationTime: event.value,
                notificationEveryHour: int.tryParse(event.value) ?? 0);
          } else {
            timePeroid[index] = PeriodTimeModel(
              code: master.code,
              notificationTime: event.value,
            );
          }
        }
        medicationDetail = medicationDetail.copyWith(periodTimes: timePeroid);
        break;
      default:
    }

    return state.copyWith(currentMedication: medicationDetail);
  }
}

void addEvent(BuildContext context, PersonalMedicationEvent event) {
  context.read<PersonalMedicationBloc>().add(event);
}

String getNameMedication(List<MasterMedicationModel> master, String id) {
  return master
      .firstWhere((master) => master.id == id,
          orElse: () => MasterMedicationModel())
      .name;
}

MasterMedicationModel getMedication(
    List<MasterMedicationModel> master, String id) {
  return master.firstWhere((master) => master.id == id,
      orElse: () => MasterMedicationModel());
}

String getNamePeriod(String periodType) {
  try {
    return Period.values
        .firstWhere((peroid) => peroid.name == periodType)
        .title;
  } catch (e) {
    print(e);
    return 'ไม่ระบุ';
  }
}

String getTimeOfMedication(String _time) {
  try {
    return TimeOfMedication.values
        .firstWhere((time) => time.name == _time)
        .title;
  } catch (e) {
    print(e);
    return 'ไม่ระบุ';
  }
}

bool checkMandatory(MedicationDetailModel currentMedication) {
  bool check = true;
  var current = currentMedication;
  var time = [...current.periodTimes];
  if (current.medicationId.isEmpty ||
      current.dosage.isEmpty ||
      current.periodType.isEmpty) {
    check = false;
  }

  if (time.isNotEmpty) {
    var checkItemTime = time
        .any((_time) => _time.notificationTime.isEmpty || _time.code.isEmpty);
    if (checkItemTime) {
      check = false;
    }
  } else {
    check = false;
  }

  return check;
}

bool checkDuplicateMedication(PersonalMedicationState _state, String _id) {
  return !_state.personalMedicationList.data
      .any((_medicationList) => _medicationList.medicationId == _id);
}
