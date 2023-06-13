import 'package:health_application/ui/elderly/search_volunteer/model/appointment_detail/appoint_code.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/appointment_detail/elderly_appointment_detail.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/appointment_detail/volunteer_appointment_detail.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../base/appoint_detail_card/bloc/appointment_card_bloc.dart';

part 'appointment_detail.g.dart';

@JsonSerializable()
class AppointmentDetail {
  const AppointmentDetail(
      {this.appointmentDate = '',
      this.appointmentTimes = const <AppointCode>[],
      this.elderly = const ElderlyAppointment(),
      this.id = '',
      this.latitude = 0,
      this.longitude = 0,
      this.note = '',
      this.status = '',
      this.types = const <AppointCode>[],
      this.volunteer = const VolunteerAppointment(),
      this.addressFull = ''});

  final String id;
  final String status;
  final ElderlyAppointment elderly;
  final VolunteerAppointment volunteer;
  final List<AppointCode> types;
  final List<AppointCode> appointmentTimes;
  final String appointmentDate;
  final String note;
  final double latitude;
  final double longitude;
  final String addressFull;

  String getTimeSlot() {
    String allName = '';
    appointmentTimes.forEach((element) {
      allName = allName + '${allName.isNotEmpty ? ',' : ''}' + element.name;
    });

    return allName;
  }

  String getTimeSlotNextLine() {
    String allName = '';
    appointmentTimes.forEach((element) {
      allName = allName + '${allName.isNotEmpty ? '\n' : ''}' + element.name;
    });

    return allName;
  }

  String getTypeAppoint() {
    String allName = '';
    types.forEach((element) {
      allName = allName + '${allName.isNotEmpty ? ',' : ''}' + element.name;
    });

    return allName;
  }

  String getStatusTitle() {
    switch (status) {
      case 'CREATE':
        return 'รอการยืนยัน';
      case 'WAITING_TO_START':
        return 'รอเริ่มงาน';
      case 'START':
        return 'เริ่มงาน';
      case 'COMPLETE':
        return 'สำเร็จ';
      case 'REJECT':
        return 'ยกเลิก';

      default:
        return 'unknown';
    }
  }

  //convert from json
  factory AppointmentDetail.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDetailFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDetailToJson(this);

  List<Object?> get props => <Object>[
        id,
        status,
        elderly,
        volunteer,
        types,
        appointmentDate,
        appointmentTimes,
        note,
        latitude,
        longitude,
        addressFull
      ];
}
