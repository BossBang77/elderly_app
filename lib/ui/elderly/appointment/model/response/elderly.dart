import 'package:health_application/ui/elderly/appointment/model/response/appointment_generic_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'elderly.g.dart';

@JsonSerializable()
class Elderly {
  const Elderly({
    this.profileId = '',
    this.name = '',
    this.gender = '',
    this.age = 0,
    this.mobileNumber = '',
    this.congenitalDisease = const[],
    this.allergicFoods = const[]
  });

  final String profileId;
  final String name;
  final String gender;
  final int age;
  final String  mobileNumber;
  final List<AppointmentGenericData> congenitalDisease;
  final List<AppointmentGenericData> allergicFoods;

  factory Elderly.fromJson(Map<String, dynamic> json) => _$ElderlyFromJson(json);
  Map<String, dynamic> toJson() => _$ElderlyToJson(this);

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