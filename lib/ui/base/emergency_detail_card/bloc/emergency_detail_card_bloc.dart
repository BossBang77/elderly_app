import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/volunteer/request_assistance_detail/model/submit_assistance.dart';
import 'package:http/retry.dart';

import '../../../../repository/volunteer_assistance_repos.dart';
import '../../../volunteer/request_assistance_detail/model/request_assitance_list.dart';

part 'emergency_detail_card_event.dart';
part 'emergency_detail_card_state.dart';

class EmergencyDetailCardBloc
    extends Bloc<EmergencyDetailCardEvent, EmergencyDetailCardState> {
  EmergencyDetailCardBloc() : super(EmergencyDetailCardInitial()) {}
  VolunteerAssistanceRepository _assistanceRepository =
      VolunteerAssistanceRepository();
  @override
  Stream<EmergencyDetailCardState> mapEventToState(
      EmergencyDetailCardEvent event) async* {
    if (event is UpdateStatus) {
      yield state.copyWith(status: event.status);
    }

    if (event is GetEmergencyList) {
      var requestList = await _assistanceRepository.getEmergencyList();
      yield* requestList.fold((Failure err) async* {
        yield state.copyWith(
            requsetAssistanceList: RequestAssitanceListModel().empty);
      }, (RequestAssitanceListModel res) async* {
        print('success');
        yield state.copyWith(requsetAssistanceList: res);
      });
    }

    if (event is AcceptAssistance) {
      var requestList =
          await _assistanceRepository.submitAssistanct(event.submitMol);
      print(event.submitMol.toJson());
      yield* requestList.fold((Failure err) async* {
        add(GetEmergencyList());
      }, (String res) async* {
        add(GetEmergencyList());
      });
    }
  }
}
