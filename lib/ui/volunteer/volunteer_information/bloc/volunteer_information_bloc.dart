import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';

import '../../../../repository/login_repos.dart';

part 'volunteer_information_event.dart';
part 'volunteer_information_state.dart';

class VolunteerInformationBloc
    extends Bloc<VolunteerInformationEvent, VolunteerInformationState> {
  final LoginRepository _loginRepository = LoginRepository();
  VolunteerInformationBloc() : super(VolunteerInformationInitial()) {
    on<VolunteerInformationEvent>((event, emit) async {
      if (event is InitialData) {
        emit(VolunteerInformationState.initial());
        emit(state.copyWith(profile: event.profile));
      }

      if (event is ChangeForm) {
        emit(state.copyWith(isLoading: true));
        var currentstate = await mappingField(event);
        emit(currentstate);
      }

      if (event is UpdateVolunteerInformation) {
        emit(state.copyWith(isLoading: true));
        var updateRes = await _loginRepository.updatePfofile(state.profile);
        updateRes.fold((error) {
          emit(state.copyWith(
              isLoading: false, statusUpdate: StatusUpdate.fail));
        }, (success) {
          emit(state.copyWith(
              isLoading: false, statusUpdate: StatusUpdate.success));
        });
      }

      if (event is ResetStatusUpdate) {
        emit(state.copyWith(statusUpdate: StatusUpdate.fail));
      }
    });
  }
  Future<VolunteerInformationState> mappingField(ChangeForm event) async {
    var user = state.profile;
    var profile = user.profile;

    switch (event.type) {
      case EditType.elderlyCareCode:
        user = user.copyWith(elderlyCareCode: event.value);
        return state.copyWith(profile: user, isLoading: false);
      case EditType.experience:
        String experience = event.value;
        int parseExperience = int.tryParse(experience) ?? 0;
        profile = profile.copyWith(experience: parseExperience);
        user = user.copyWith(profile: profile);
        return state.copyWith(profile: user, isLoading: false);

      default:
        return state.copyWith(profile: user, isLoading: false);
    }
  }
}
