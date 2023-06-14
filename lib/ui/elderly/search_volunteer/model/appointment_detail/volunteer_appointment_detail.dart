import 'package:json_annotation/json_annotation.dart';

part 'volunteer_appointment_detail.g.dart';

@JsonSerializable()
class VolunteerAppointment {
  const VolunteerAppointment(
      {this.age = 0,
      this.elderlyCareCode = '',
      this.elderlyCareContactMobile = '',
      this.elderlyCareName = '',
      this.image = '',
      this.name = '',
      this.profileId = ''});

  final String profileId;
  final String name;
  final String image;
  final int age;
  final String elderlyCareCode;
  final String elderlyCareName;
  final String elderlyCareContactMobile;

  //convert from json
  factory VolunteerAppointment.fromJson(Map<String, dynamic> json) =>
      _$VolunteerAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$VolunteerAppointmentToJson(this);

  List<Object?> get props => <Object>[
        profileId,
        name,
        age,
        elderlyCareCode,
        elderlyCareName,
        elderlyCareContactMobile
      ];
}
