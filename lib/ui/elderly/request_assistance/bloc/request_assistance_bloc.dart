import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/emergency_repos.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/elderly/request_assistance/model/request/create_emergency_model.dart';
import 'package:health_application/ui/elderly/request_assistance/model/request/update_status_emergency_model.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';

import '../model/reesponse/emergency_detail_model.dart';

part 'request_assistance_event.dart';
part 'request_assistance_state.dart';

class RequestAssistanceBloc
    extends Bloc<RequestAssistanceEvent, RequestAssistanceState> {
  RequestAssistanceBloc() : super(RequestAssistanceInitial()) {}

  EmergencyRepository _emergencyRepository = EmergencyRepository();
  @override
  Stream<RequestAssistanceState> mapEventToState(
      RequestAssistanceEvent event) async* {
    if (event is UpdateStatus) {
      yield state.copyWith(assistanceStatus: event.status);
    }
    if (event is SetLoading) {
      yield state.copyWith(isLoading: event.loading);
    }
    if (event is CreateEmergency) {
      yield state.copyWith(isLoading: true);
      var res = await _emergencyRepository
          .createEmergency(event.createEmergencyModel);
      yield* res.fold((Failure err) async* {
        yield state.copyWith(
            isLoading: false,
            assistanceStatus: AssistanceStatus.emergencyCall,
            statusSubmit: StatusSubmit.createEmergencyFail);
      }, (String res) async* {
        yield state.copyWith(
            isLoading: false,
            assistanceStatus: AssistanceStatus.waitingForHelp);
        add(GetEmergencyDetail());
      });
    }

    if (event is GetEmergencyDetail) {
      yield state.copyWith(isLoading: true, statusSubmit: StatusSubmit.initial);
      var res = await _emergencyRepository.getEmergencyDetail();
      yield* res.fold((Failure err) async* {
        yield state.copyWith(
          emergencyHelpDetail: EmergencyHelpDetailModel(),
          assistanceStatus: AssistanceStatus.emergencyCall,
          isLoading: false,
        );
      }, (EmergencyHelpDetailModel res) async* {
        AssistanceStatus status = AssistanceStatus.waitingForHelp;
        if (res.status == EmergencyStatus.WAITING.name) {
          await requestUpdateEmergency();
        }
        if (res.emergencyHelpers.isNotEmpty) {
          status = AssistanceStatus.volunteerAccept;
        }
        yield state.copyWith(
            isLoading: false,
            emergencyHelpDetail: res,
            assistanceStatus: status);
      });
    }

    if (event is SubmitIsSafe) {
      yield state.copyWith(isLoading: true);
      UpdateStatusEmergencyModel body = UpdateStatusEmergencyModel(
          id: state.emergencyHelpDetail.id,
          status: EmergencyStatus.ELDERLY_COMPLETE.name);
      var res = await _emergencyRepository.updateEmergencyStatus(body);
      yield* res.fold((Failure err) async* {
        yield state.copyWith(
            isLoading: false, statusSubmit: StatusSubmit.sendSafeFail);
      }, (String res) async* {
        yield state.copyWith(
            isLoading: false, statusSubmit: StatusSubmit.sendSafeSuccess);
      });
    }

    if (event is ResetSubmitStatus) {
      yield state.copyWith(statusSubmit: StatusSubmit.initial);
    }

    if (event is UpdateEmergetcyDetail) {
      var res = await _emergencyRepository.getEmergencyDetail();
      yield* res.fold((Failure err) async* {
        //TODO
      }, (EmergencyHelpDetailModel res) async* {
        AssistanceStatus status = AssistanceStatus.waitingForHelp;
        if (res.status == EmergencyStatus.WAITING.name) {
          await requestUpdateEmergency();
        }
        // check change data
        if (res.emergencyHelpers.length !=
            state.emergencyHelpDetail.emergencyHelpers.length) {
          if (res.emergencyHelpers.isNotEmpty) {
            status = AssistanceStatus.volunteerAccept;
          }
          yield state.copyWith(
              isLoading: false,
              emergencyHelpDetail: res,
              assistanceStatus: status);
        }
      });
    }
  }

  Future requestUpdateEmergency() async {
    // Call new update every 10 sec
    Future.delayed(Duration(seconds: 10), () {
      add(UpdateEmergetcyDetail());
    });
  }
}
