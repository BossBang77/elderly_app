import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/volunteer_assistance_repos.dart';
import 'package:health_application/repository/volunteer_home_repos.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/register_profile/volunteer/model/elderly_profile_model.dart';
import 'package:health_application/ui/register_profile/volunteer/model/elderly_profile_response.dart';
import 'package:health_application/ui/volunteer/request_assistance_detail/model/assitance_model.dart';

part 'request_assistance_event.dart';
part 'request_assistance_state.dart';

class RequestAssistanceBloc
    extends Bloc<RequestAssistanceEvent, RequestAssistanceState> {
  RequestAssistanceBloc() : super(RequestAssistanceInitial()) {}
  VolunteerAssistanceRepository _assistanceRepository =
      VolunteerAssistanceRepository();
  VolunteerHomeRepository _volunteerHomeRepository = VolunteerHomeRepository();
  @override
  Stream<RequestAssistanceState> mapEventToState(
      RequestAssistanceEvent event) async* {
    if (event is GetAssistanceDatail) {
      yield state.copyWith(isLoading: true);
      var emergencyDetail =
          await _assistanceRepository.getEmergencyDetail(event.emergencyId);
      yield* emergencyDetail.fold((err) async* {
        yield state.copyWith(
            emergencyDetail: AssitanceDetailModel(), isLoading: false);
      }, (res) async* {
        yield state.copyWith(emergencyDetail: res, isLoading: false);
      });
    }
    if (event is GetElderlyProfile) {
      var key = event.id;
      yield state.copyWith(isLoading: true);
      var userProfile = await _volunteerHomeRepository.getElderlyProfile(key);
      yield* userProfile.fold((Failure error) async* {
        yield state.copyWith(
            elderlyProfile: ElderlyProfileModel(),
            isLoading: false,
            eventStatus: EventStatus.searchElderlyFail);
      }, (ElderlyProfileResponse res) async* {
        ElderlyProfileModel profile = res.data;
        yield state.copyWith(
            elderlyProfile: profile,
            isLoading: false,
            eventStatus: EventStatus.searchElderlySuccess);
      });
    }
    if (event is SetInitialEvent) {
      yield state.copyWith(eventStatus: EventStatus.initial);
    }
  }
}
