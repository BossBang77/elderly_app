import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/ui/base/constant/gender_const.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/appointment_detail/appointment_list.dart';

import '../../../../repository/elderly_appointment_repos.dart';

part 'appointment_card_event.dart';
part 'appointment_card_state.dart';

class AppointmentCardBloc
    extends Bloc<AppointmentCardEvent, AppointmentCardState> {
  AppointmentCardBloc() : super(AppointmentCardInitial()) {}

  ElderlyAppointmentRepository _elderlyAppointmentRepository =
      ElderlyAppointmentRepository();
  @override
  Stream<AppointmentCardState> mapEventToState(
      AppointmentCardEvent event) async* {
    if (event is SetUID) {
      yield state.copyWith(uid: event.uid);
    }
    if (event is GetAppointList) {
      var searchAppointList = await _elderlyAppointmentRepository.getAppointList(
          elderlyProfileId: state.uid,
          include:
              '${AppointStatus.CREATE.name},${AppointStatus.WAITING_TO_START.name},${AppointStatus.START.name}');
      yield* searchAppointList.fold((Failure err) async* {
        yield state.copyWith(appointList: AppointList());
      }, (AppointList res) async* {
        yield state.copyWith(appointList: res);
      });
    }
  }

  Future IntitalState() async {
    String uid = await UserSecureStorage().getUID();
    add(SetUID(uid: uid));
    add(GetAppointList());
  }
}
