import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/volunteer_assistance_repos.dart';
import 'package:health_application/ui/volunteer/request_assistance_detail/model/assitance_model.dart';

part 'request_assistance_event.dart';
part 'request_assistance_state.dart';

class RequestAssistanceBloc
    extends Bloc<RequestAssistanceEvent, RequestAssistanceState> {
  RequestAssistanceBloc() : super(RequestAssistanceInitial()) {}
  VolunteerAssistanceRepository _assistanceRepository =
      VolunteerAssistanceRepository();
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
  }
}
