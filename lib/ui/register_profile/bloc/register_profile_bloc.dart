import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:health_application/repository/register_repos.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/extension/string_extension.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';

import '../../base/model/failure.dart';

part 'register_profile_event.dart';
part 'register_profile_state.dart';

class RegisterProfileBloc
    extends Bloc<RegisterProfileEvent, RegisterProfileState> {
  RegisterProfileBloc() : super(RegisterProfileInitial()) {}
  final RegisterRepository _registerRepository = RegisterRepository();
  @override
  Stream<RegisterProfileState> mapEventToState(
      RegisterProfileEvent event) async* {
    if (event is SelectRole) {
      yield state.copyWith(roleType: event.roleType);
      add(ResetRegisterModel());
    }
    if (event is ChangeProfileView) {
      yield state.copyWith(profileType: event.profileType);
    }
    if (event is SelectGender) {
      yield state.copyWith(gender: event.gender);
    }
    if (event is ForwardBMIDetail) {
      if (state.bmiDetail.index + 1 < BMIDetail.values.length) {
        yield state.copyWith(
            bmiDetail: BMIDetail.values[state.bmiDetail.index + 1]);
      } else {}
    }

    if (event is BackwardBMIDetail) {
      if (state.bmiDetail.index - 1 >= 0) {
        yield state.copyWith(
            bmiDetail: BMIDetail.values[state.bmiDetail.index - 1]);
      } else {}
    }

    if (event is FormFillType) {
      yield setFillInformation(event);
    }

    if (event is CalculateBMI) {
      var profile = state.registerModel.profile;
      double height_m = profile.height / 100;
      double bmiValue = profile.weight / (height_m * height_m);
      yield state.copyWith(bmiValue: bmiValue);
    }

    if (event is SubmitRegister) {
      yield state.copyWith(status: SubmitStatus.loading);
      var submit =
          await _registerRepository.registerProfile(state.registerModel);
      yield* submit.fold((Failure error) async* {
        yield state.copyWith(status: SubmitStatus.fail);
      }, (int res) async* {
        yield state.copyWith(
            status: SubmitStatus.success, profileType: ProfileType.success);
      });
    }
    if (event is ObscurePassword) {
      yield state.copyWith(obscurePassword: !state.obscurePassword);
    }
    if (event is InitialStatus) {
      yield state.copyWith(status: SubmitStatus.initial);
    }

    if (event is CheckExisting) {
      var checkExisting =
          await _registerRepository.checkExisting(event.userName);
      yield* checkExisting.fold((err) async* {
        yield state.copyWith(isNotExisting: err);
      }, (res) async* {
        yield state.copyWith(isNotExisting: res);
      });
    }

    if (event is ResetRegisterModel) {
      yield state.copyWith(registerModel: RegisterModel());
    }
  }

  RegisterProfileState setFillInformation(FormFillType event) {
    var regisMol = state.registerModel;
    var profileMol = regisMol.profile;
    var congenitalMol = [...regisMol.congenitalDisease];
    var allergicFoodsMol = [...regisMol.allergicFoods];
    switch (event.type) {
      case FillType.role:
        regisMol = regisMol.copyWith(role: event.value);
        return state.copyWith(registerModel: regisMol);

      case FillType.username:
        regisMol = regisMol.copyWith(username: event.value);
        return state.copyWith(registerModel: regisMol);

      case FillType.password:
        regisMol = regisMol.copyWith(password: event.value);
        return state.copyWith(registerModel: regisMol);

      case FillType.volunteerCode:
        regisMol = regisMol.copyWith(volunteerCode: event.value);
        return state.copyWith(registerModel: regisMol);

      case FillType.elderlyCareCode:
        regisMol = regisMol.copyWith(elderlyCareCode: event.value);
        return state.copyWith(registerModel: regisMol);

      case FillType.name:
        profileMol = profileMol.copyWith(name: event.value);
        regisMol = regisMol.copyWith(profile: profileMol);
        return state.copyWith(registerModel: regisMol);

      case FillType.birthDate:
        String birthDate = event.value;
        int age = userAge(DateTime.now(), birthDate.parseTime());
        profileMol = profileMol.copyWith(birthDate: event.value, age: age);
        regisMol = regisMol.copyWith(profile: profileMol);
        return state.copyWith(registerModel: regisMol);

      case FillType.weightDetail:
        profileMol = profileMol.copyWith(weight: event.value);
        regisMol = regisMol.copyWith(profile: profileMol);
        return state.copyWith(registerModel: regisMol);

      case FillType.heightDetail:
        profileMol = profileMol.copyWith(height: event.value);
        regisMol = regisMol.copyWith(profile: profileMol);
        return state.copyWith(registerModel: regisMol);
      case FillType.gender:
        profileMol = profileMol.copyWith(gender: event.value);
        regisMol = regisMol.copyWith(profile: profileMol);
        return state.copyWith(registerModel: regisMol);

      case FillType.addDisease:
        congenitalMol.add(event.value);
        regisMol = regisMol.copyWith(congenitalDisease: congenitalMol);
        return state.copyWith(registerModel: regisMol);

      case FillType.delDisease:
        congenitalMol
            .removeWhere((element) => element.code == event.value.code);
        regisMol = regisMol.copyWith(congenitalDisease: congenitalMol);
        return state.copyWith(registerModel: regisMol);
      case FillType.delAllDisease:
        congenitalMol = [];
        regisMol = regisMol.copyWith(congenitalDisease: congenitalMol);
        return state.copyWith(registerModel: regisMol, textFilterDisease: '');

      case FillType.searchDisease:
        return state.copyWith(textFilterDisease: event.value);

      case FillType.addAllergies:
        allergicFoodsMol.add(event.value);
        regisMol = regisMol.copyWith(allergicFoods: allergicFoodsMol);
        return state.copyWith(registerModel: regisMol);

      case FillType.delAllergies:
        allergicFoodsMol
            .removeWhere((element) => element.code == event.value.code);
        regisMol = regisMol.copyWith(allergicFoods: allergicFoodsMol);
        return state.copyWith(registerModel: regisMol);
      case FillType.delAllAllergies:
        allergicFoodsMol = [];
        regisMol = regisMol.copyWith(allergicFoods: allergicFoodsMol);
        return state.copyWith(registerModel: regisMol, textFilterAllergies: '');

      case FillType.searchAllergies:
        return state.copyWith(textFilterAllergies: event.value);

      default:
        return state;
    }
  }
}

Future dateInvalidFormat(BuildContext context) async {
  final bool acceptClose = await showDialog(
      context: context,
      builder: (BuildContext context) => ErrorAlertWidget(
            title: 'เกิดข้อผิดพลาด',
            subTitle: "วันเกิดไม่ถูกต้อง \n กรุณาตรวจสอบข้อมูล",
            btnName: 'ตกลง',
          )) as bool;
}

int userAge(DateTime curruntDate, DateTime UsersBirthDate) {
  Duration parse = curruntDate.difference(UsersBirthDate);

  return parse.inDays ~/ 360;
}
