import 'package:health_application/ui/elderly/appointment/model/response/appointment_generic_data.dart';
import 'package:health_application/ui/elderly/appointment/model/response/elderly.dart';
import 'package:health_application/ui/elderly/appointment/model/response/volunteer.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  const Appointment({
    this.id = '',
    this.status = '',
    this.elderly = const Elderly(),
    this.volunteer = const Volunteer(),
    this.types = const[],
    this.appointmentDate = '',
    this.appointmentTimes = const[],
    this.note = '',
    this.addressFull = '',
    this.latitude = 0,
    this.longitude = 0
  });

  final String id;
  final String status;
  final Elderly elderly;
  final Volunteer volunteer;
  final List<AppointmentGenericData> types;
  final String appointmentDate;
  final List<AppointmentGenericData> appointmentTimes;
  final String note;
  final String addressFull;
  final double latitude;
  final double longitude;

  factory Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentToJson(this);

  List<Object?> get props => <Object>[
    id,
    status,
    elderly,
    volunteer,
    types,
    appointmentDate,
    appointmentTimes,
    note,
    addressFull,
    latitude,
    longitude
  ];

  Appointment updateStatus(String status) {
    return Appointment(
      id: this.id,
      status: status,
      elderly: this.elderly,
      volunteer: this.volunteer,
      types: this.types,
      appointmentDate: this.appointmentDate,
      appointmentTimes: this.appointmentTimes,
      note: this.note,
      addressFull: this.addressFull,
      latitude: this.latitude,
      longitude: this.longitude
    );
  }

  bool isAppointmentConfirm() {
    if (status == AppointmentStatus.create.value) {
      return false;
    }
    return true;
  }

  String genderToDisplayFormat() {
    if (elderly.gender == 'MALE') {
      return 'เพศชาย';
    } else if (elderly.gender == 'FEMALE') {
      return 'เพศหญิง';
    }
    return '';
  }

  String genderToImagePath() {
    if (elderly.gender == 'MALE') {
      return 'assets/images/profile_man.png';
    } else if (elderly.gender == 'FEMALE') {
      return 'assets/images/profile_woman.png';
    }
    return 'assets/images/profile_woman.png';
  }
}