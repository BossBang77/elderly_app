import 'package:health_application/ui/elderly/search_volunteer/model/appointment/code_model.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/appointment_detail/appoint_code.dart';
import 'package:json_annotation/json_annotation.dart';

part 'elderly_appointment_detail.g.dart';

@JsonSerializable()
class ElderlyAppointment {
  const ElderlyAppointment(
      {this.age = 0,
      this.allergicFoods = const <AppointCode>[],
      this.gender = '',
      this.congenitalDisease = const <AppointCode>[],
      this.mobileNumber = '',
      this.name = '',
      this.profileId = ''});

  final String profileId;
  final String name;
  final String gender;
  final int age;
  final String mobileNumber;
  final List<AppointCode> congenitalDisease;
  final List<AppointCode> allergicFoods;

  String getCongenital() {
    String allName = '';
    congenitalDisease.forEach((element) {
      allName = allName + '${allName.isNotEmpty ? ',' : ''}' + element.name;
    });

    return allName;
  }

  String getAllergicFoods() {
    String allName = '';
    allergicFoods.forEach((element) {
      allName = allName + '${allName.isNotEmpty ? ',' : ''}' + element.name;
    });

    return allName;
  }

  //convert from json
  factory ElderlyAppointment.fromJson(Map<String, dynamic> json) =>
      _$ElderlyAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$ElderlyAppointmentToJson(this);

  List<Object?> get props => <Object>[
        profileId,
        name,
        gender,
        age,
        mobileNumber,
        congenitalDisease,
        allergicFoods
      ];
}
