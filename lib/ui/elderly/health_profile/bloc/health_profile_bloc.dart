import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:http/retry.dart';

import '../../../../repository/login_repos.dart';

part 'health_profile_event.dart';
part 'health_profile_state.dart';

class HealthProfileBloc extends Bloc<HealthProfileEvent, HealthProfileState> {
  HealthProfileBloc() : super(HealthProfileInitial()) {}
  LoginRepository _loginRepository = LoginRepository();
  @override
  Stream<HealthProfileState> mapEventToState(HealthProfileEvent event) async* {
    if (event is ChangePageView) {
      yield state.copyWith(pageView: event.pageView);
    }

    if (event is SetProfile) {
      yield state.copyWith(
          masterProfile: event.master, currentProfile: event.master);
    }

    if (event is FormFillType) {
      yield setFillInformation(event);
    }

    if (event is SubmitEdit) {
      yield state.copyWith(
          masterProfile: state.currentProfile,
          pageView: PageViewWidget.summary);
    }

    if (event is SubmitEditProfile) {
      var res = await _loginRepository.updatePfofile(state.currentProfile);

      yield* res.fold((l) async* {
        yield state.copyWith(statusUpdate: StatusUpdate.updateFail);
      }, (r) async* {
        yield state.copyWith(statusUpdate: StatusUpdate.updateSuccess);
      });
    }

    if (event is ResetStatusUpdate) {
      yield state.copyWith(statusUpdate: StatusUpdate.initial);
    }
  }

  HealthProfileState setFillInformation(FormFillType event) {
    var regisMol = state.currentProfile;
    var profileMol = regisMol.profile;
    var congenitalMol = [...regisMol.congenitalDisease];
    var allergicFoodsMol = [...regisMol.allergicFoods];
    switch (event.type) {
      case FillType.role:
        regisMol = regisMol.copyWith(role: event.value);
        return state.copyWith(currentProfile: regisMol);

      case FillType.username:
        regisMol = regisMol.copyWith(username: event.value);
        return state.copyWith(currentProfile: regisMol);

      case FillType.password:
        regisMol = regisMol.copyWith(password: event.value);
        return state.copyWith(currentProfile: regisMol);

      case FillType.volunteerCode:
        regisMol = regisMol.copyWith(volunteerCode: event.value);
        return state.copyWith(currentProfile: regisMol);

      case FillType.elderlyCareCode:
        regisMol = regisMol.copyWith(elderlyCareCode: event.value);
        return state.copyWith(currentProfile: regisMol);

      case FillType.name:
        profileMol = profileMol.copyWith(name: event.value);
        regisMol = regisMol.copyWith(profile: profileMol);
        return state.copyWith(currentProfile: regisMol);

      case FillType.age:
        profileMol = profileMol.copyWith(age: event.value);
        regisMol = regisMol.copyWith(profile: profileMol);
        return state.copyWith(currentProfile: regisMol);

      case FillType.birthDate:
        profileMol = profileMol.copyWith(birthDate: event.value);
        regisMol = regisMol.copyWith(profile: profileMol);
        return state.copyWith(currentProfile: regisMol);

      case FillType.weightDetail:
        profileMol = profileMol.copyWith(weight: event.value);
        regisMol = regisMol.copyWith(profile: profileMol);
        return state.copyWith(currentProfile: regisMol);

      case FillType.heightDetail:
        profileMol = profileMol.copyWith(height: event.value);
        regisMol = regisMol.copyWith(profile: profileMol);
        return state.copyWith(currentProfile: regisMol);
      case FillType.gender:
        profileMol = profileMol.copyWith(gender: event.value);
        regisMol = regisMol.copyWith(profile: profileMol);
        return state.copyWith(currentProfile: regisMol);

      case FillType.addDisease:
        congenitalMol.add(event.value);
        regisMol = regisMol.copyWith(congenitalDisease: congenitalMol);
        return state.copyWith(currentProfile: regisMol);

      case FillType.delDisease:
        congenitalMol
            .removeWhere((element) => element.code == event.value.code);
        regisMol = regisMol.copyWith(congenitalDisease: congenitalMol);
        return state.copyWith(currentProfile: regisMol);
      case FillType.delAllDisease:
        congenitalMol = [];
        regisMol = regisMol.copyWith(congenitalDisease: congenitalMol);
        return state.copyWith(currentProfile: regisMol, textFilterDisease: '');

      case FillType.searchDisease:
        return state.copyWith(textFilterDisease: event.value);

      case FillType.addAllergies:
        allergicFoodsMol.add(event.value);
        regisMol = regisMol.copyWith(allergicFoods: allergicFoodsMol);
        return state.copyWith(currentProfile: regisMol);

      case FillType.delAllergies:
        allergicFoodsMol
            .removeWhere((element) => element.code == event.value.code);
        regisMol = regisMol.copyWith(allergicFoods: allergicFoodsMol);
        return state.copyWith(currentProfile: regisMol);
      case FillType.delAllAllergies:
        allergicFoodsMol = [];
        regisMol = regisMol.copyWith(allergicFoods: allergicFoodsMol);
        return state.copyWith(
            currentProfile: regisMol, textFilterAllergies: '');

      case FillType.searchAllergies:
        return state.copyWith(textFilterAllergies: event.value);

      case FillType.resetDisease:
        congenitalMol = [...state.masterProfile.congenitalDisease];
        regisMol = regisMol.copyWith(congenitalDisease: congenitalMol);
        return state.copyWith(
            currentProfile: regisMol,
            pageView: PageViewWidget.summary,
            textFilterDisease: '');

      case FillType.resetAllergies:
        allergicFoodsMol = [...state.masterProfile.allergicFoods];
        regisMol = regisMol.copyWith(allergicFoods: allergicFoodsMol);
        return state.copyWith(
            currentProfile: regisMol,
            pageView: PageViewWidget.summary,
            textFilterAllergies: '');

      default:
        return state;
    }
  }
}

addEvent(BuildContext context, HealthProfileEvent event) {
  context.read<HealthProfileBloc>().add(event);
}

String checkBMI(double bmiValue) {
  double value = bmiValue;
  if (value < 18.5) {
    // ต่ำกว่าเกณฑ์
    return 'assets/images/bmi_low.png';
  } else if (value > 24.9) {
    // สูงกว่าเกณฑ์
    return 'assets/images/bmi_height.png';
  } else {
    //ปกติ
    return 'assets/images/bmi_medium.png';
  }
}

double calculateBMI(int weight, int height) {
  double height_m = height / 100;
  return weight / (height_m * height_m);
}

String getBMITitle(double BMI) {
  if (BMI < 18.5) {
    // ต่ำกว่าเกณฑ์
    return 'ต่ำกว่าเกณฑ์';
  } else if (BMI > 24.9) {
    // สูงกว่าเกณฑ์
    return 'สูงกว่าเกณฑ์';
  } else {
    //ปกติ
    return 'ตรงตามเกณฑ์';
  }
}
