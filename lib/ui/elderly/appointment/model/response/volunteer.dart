import 'package:json_annotation/json_annotation.dart';

part 'volunteer.g.dart';

@JsonSerializable()
class Volunteer {
  const Volunteer({
    this.profileId = '',
    this.name = '',
    this.image = '',
    this.elderlyCareCode = '',
    this.elderlyCareName = '',
    this.elderlyCareContactMobile = '' 
  });

  final String profileId;
  final String name;
  final String image;
  final String elderlyCareCode;
  final String elderlyCareName;
  final String elderlyCareContactMobile;

  factory Volunteer.fromJson(Map<String, dynamic> json) => _$VolunteerFromJson(json);
  Map<String, dynamic> toJson() => _$VolunteerToJson(this);

  List<Object?> get props => <Object>[
    profileId,
    name,
    image,
    elderlyCareCode,
    elderlyCareName,
    elderlyCareContactMobile
  ];
}