import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/elderly_appointment_repos.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/appointment_detail/appointment_detail.dart';
import 'package:health_application/ui/elderly/volunteer_appoint_summary/model/update_status_req.dart';
import 'package:url_launcher/url_launcher.dart';

part 'appoint_summary_event.dart';
part 'appoint_summary_state.dart';

class AppointSummaryBloc
    extends Bloc<AppointSummaryEvent, AppointSummaryState> {
  AppointSummaryBloc() : super(AppointSummaryInitial()) {}
  ElderlyAppointmentRepository _elderlyAppointmentRepository =
      ElderlyAppointmentRepository();
  @override
  Stream<AppointSummaryState> mapEventToState(
      AppointSummaryEvent event) async* {
    if (event is GetAppointmentId) {
      yield state.copyWith(isLoading: true);
      var detail =
          await _elderlyAppointmentRepository.getAppointByIdt(event.id);
      yield* detail.fold((l) async* {
        yield state.copyWith(
            appointDetail: AppointmentDetail(), isLoading: false);
      }, (AppointmentDetail res) async* {
        yield state.copyWith(appointDetail: res, isLoading: false);
      });
    }

    if (event is RejectAppointment) {
      yield state.copyWith(isLoading: true);
      UpdateStatusReq req = UpdateStatusReq(
          status: AppointStatus.REJECT.name, appointmentId: event.appointId);
      var detail = await _elderlyAppointmentRepository.updateStatus(req);
      yield* detail.fold((l) async* {
        yield state.copyWith(
            isLoading: false, statusUpdate: StatusUpdate.updateStatusFail);
      }, (String res) async* {
        yield state.copyWith(
            isLoading: false, statusUpdate: StatusUpdate.updateStatusSuccess);
      });
    }

    if (event is UpdateStatus) {
      yield state.copyWith(statusUpdate: event.statusUpdate);
    }
  }
}

int getStatusNumber(String status) {
  switch (status) {
    case 'CREATE':
      return 1;
    case 'WAITING_TO_START':
      return 2;
    case 'START':
      return 3;
    case 'COMPLETE':
      return 4;
    case 'REJECT':
      return 0;

    default:
      return 0;
  }
}

void launchMapsUrl(double lat, double lon) async {
  String googleUrl =
      'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
  if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
  } else {
    throw 'Could not open the map.';
  }
}

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  try {
    await launchUrl(launchUri);
  } catch (e) {
    print(e);
  }
}
