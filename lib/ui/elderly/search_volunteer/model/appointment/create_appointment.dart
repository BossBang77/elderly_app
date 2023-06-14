import 'package:health_application/ui/elderly/search_volunteer/model/appointment/code_model.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/appointment/profile_id.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:json_annotation/json_annotation.dart';
part 'create_appointment.g.dart';

@JsonSerializable()
class CreateAppointmentModel {
  const CreateAppointmentModel(
      {this.elderly = const ProfileIdModel(),
      this.volunteer = const ProfileIdModel(),
      this.addressFull = '',
      this.appointmentDate = '',
      this.appointmentTimes = const <CodeModel>[],
      this.note = '',
      this.latitude = 0,
      this.longitude = 0,
      this.types = const <CodeModel>[]});

  //convert from json
  factory CreateAppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$CreateAppointmentModelFromJson(json);
  final ProfileIdModel elderly;
  final ProfileIdModel volunteer;
  final List<CodeModel> types;
  final List<CodeModel> appointmentTimes;
  final String appointmentDate;
  final String note;
  final String addressFull;
  final double latitude;
  final double longitude;

  DateTime getDateAppointment() {
    return appointmentDate.parseTime();
  }

  Map<String, dynamic> toJson() => _$CreateAppointmentModelToJson(this);

  CreateAppointmentModel copyWith(
          {ProfileIdModel? volunteer,
          ProfileIdModel? elderly,
          List<CodeModel>? types,
          List<CodeModel>? appointmentTimes,
          String? appointmentDate,
          String? note,
          String? addressFull,
          double? latitude,
          double? longitude}) =>
      CreateAppointmentModel(
          volunteer: volunteer ?? this.volunteer,
          elderly: elderly ?? this.elderly,
          types: types ?? this.types,
          appointmentDate: appointmentDate ?? this.appointmentDate,
          appointmentTimes: appointmentTimes ?? this.appointmentTimes,
          note: note ?? this.note,
          addressFull: addressFull ?? this.addressFull,
          latitude: latitude ?? this.latitude,
          longitude: longitude ?? this.longitude);

  List<Object?> get props => <Object>[
        volunteer,
        elderly,
        types,
        appointmentDate,
        appointmentTimes,
        note,
        addressFull,
        latitude,
        longitude
      ];
}
