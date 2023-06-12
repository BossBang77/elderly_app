import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/register_repos.dart';
import 'package:health_application/ui/base/encrypt/encrypt.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';

part 'volunteer_register_event.dart';
part 'volunteer_register_state.dart';

class VolunteerRegisterBloc
    extends Bloc<VolunteerRegisterEvent, VolunteerRegisterState> {
  VolunteerRegisterBloc() : super(VolunteerRegisterState.initial()) {}
  final RegisterRepository _registerRepository = RegisterRepository();

  @override
  Stream<VolunteerRegisterState> mapEventToState(
      VolunteerRegisterEvent event) async* {
    if (event is UpdateValue) {
      var registerData = state.registerData;
      var profile = state.registerData.profile;
      switch (event.type) {
        case FormFieldType.name:
          profile = profile.copyWith(name: event.value);
          registerData = registerData.copyWith(profile: profile);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.cid:
          profile = profile.copyWith(citizenId: event.value);
          registerData = registerData.copyWith(profile: profile);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.sex:
          profile = profile.copyWith(gender: event.value);
          registerData = registerData.copyWith(profile: profile);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.birthDate:
          profile = profile.copyWith(birthDate: event.value);
          registerData = registerData.copyWith(profile: profile);
          yield state.copyWth(registerData: registerData);
          break;
      }
    }

    if (event is InitialForm) {
      yield state.copyWth(registerData: event.data);
    }

    if (event is DefaultStatus) {
      yield state.copyWth(status: RegisterStatus.initial);
    }

    if (event is RegisterProfile) {
      var encryptCid =
          await EncryptData.encryptAES(state.registerData.profile.citizenId);
      var profile = state.registerData.profile.copyWith(citizenId: encryptCid);
      var regisModel = state.registerData.copyWith(profile: profile);

      yield state.copyWth(status: RegisterStatus.loading);
      var submit = await _registerRepository.registerProfile(regisModel);
      yield* submit.fold((Failure error) async* {
        yield state.copyWth(status: RegisterStatus.fail);
      }, (int res) async* {
        yield state.copyWth(status: RegisterStatus.success);
      });
    }
  }
}
