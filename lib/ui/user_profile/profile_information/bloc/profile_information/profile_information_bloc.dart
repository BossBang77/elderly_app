import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:health_application/repository/login_repos.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../base/encrypt/encrypt.dart';

part 'profile_information_event.dart';
part 'profile_information_state.dart';

class ProfileInformationBloc
    extends Bloc<ProfileInformationEvent, ProfileInformationState> {
  ProfileInformationBloc() : super(ProfileInformationInitial()) {}
  LoginRepository _loginRepository = LoginRepository();
  @override
  Stream<ProfileInformationState> mapEventToState(
      ProfileInformationEvent event) async* {
    if (event is UploadImageProfile) {
      yield state.copyWith(isLoading: true);
      File file = File(event.img!.path);
      var res = await _loginRepository.uploadImageProfile(file);
      yield* res.fold((err) async* {
        // Upload img fail
        yield state.copyWith(
            pickedFile: XFile(''),
            isLoading: false,
            submitStatus: SubmitStatus.uploadImgFail);
      }, (res) async* {
        //upload img success
        yield state.copyWith(
            pickedFile: event.img,
            isLoading: false,
            submitStatus: SubmitStatus.uploadImgSuccess);
      });
    }

    if (event is SetIntitalData) {
      yield ProfileInformationState.initial();
      yield state.copyWith(isLoading: true);
      var role = await getRole();
      yield state.copyWith(
          profile: event.profile,
          submitStatus: SubmitStatus.initial,
          isLoading: false,
          role: role);
    }

    if (event is ChangeName) {
      var user = state.profile;
      var profile = user.profile;
      profile = profile.copyWith(name: event.name);
      user = user.copyWith(profile: profile);
      yield state.copyWith(profile: user);
    }

    if (event is ChangeElderlyCode) {
      var user = state.profile;
      user = user.copyWith(elderlyCareCode: event.elderlyCode);
      yield state.copyWith(profile: user);
    }

    if (event is ChangePhoneNumber) {
      var user = state.profile;
      user = user.copyWith(username: event.phoneNumber);
      yield state.copyWith(profile: user);
    }

    if (event is SubmitProfile) {
      yield state.copyWith(isLoading: true);
      var submit = await _loginRepository.updatePfofile(state.profile);

      yield* submit.fold((err) async* {
        yield state.copyWith(
            isLoading: false, submitStatus: SubmitStatus.submitFail);
      }, (reso) async* {
        yield state.copyWith(
            isLoading: false, submitStatus: SubmitStatus.submitSuccess);
      });
    }

    if (event is InitialSubmitStatus) {
      yield state.copyWith(submitStatus: SubmitStatus.initial);
    }

    if (event is ChangeGender) {
      var user = state.profile;
      var profile = user.profile;
      profile = profile.copyWith(gender: event.gender);
      user = user.copyWith(profile: profile);
      yield state.copyWith(profile: user);
    }

    if (event is ChangeBirthdate) {
      var user = state.profile;
      var profile = user.profile;
      profile = profile.copyWith(birthDate: event.birthDate);
      user = user.copyWith(profile: profile);
      yield state.copyWith(profile: user);
    }

    if (event is ChangeCitizenId) {
      var user = state.profile;
      var profile = user.profile;
      profile = profile.copyWith(citizenId: event.citizenId);
      user = user.copyWith(profile: profile);
      yield state.copyWith(profile: user);
    }
  }
}

Future<String> getRole() async {
  var roleList = await UserSecureStorage().getRole();
  return roleList[0].role;
}

bool checkValidateCitizen(String citizenId) {
  return citizenId.length > 0 && citizenId.length < 13;
}
