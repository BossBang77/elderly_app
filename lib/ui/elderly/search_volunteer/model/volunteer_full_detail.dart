import 'package:health_application/ui/elderly/search_volunteer/model/volunteer_address_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'volunteer_full_detail.g.dart';

@JsonSerializable()
class VolunteerFullDetail {
  const VolunteerFullDetail(
      {this.age = 0,
      this.description = '',
      this.elderlyCareCode = '',
      this.elderlyCareContactMobile = '',
      this.elderlyCareName = '',
      this.experience = 0,
      this.image = '',
      this.name = '',
      this.rating = 0,
      this.totalAppointmentComplated = 0,
      this.volunteerCode = '',
      this.gender = '',
      this.address = const VolunteerAddressModel()});

  final String name;
  final String image;
  final int rating;
  final int age;
  final int experience;
  final int totalAppointmentComplated;
  final String description;
  final String volunteerCode;
  final String elderlyCareCode;
  final String elderlyCareName;
  final String elderlyCareContactMobile;
  final String gender;
  final VolunteerAddressModel address;

  //convert from json
  factory VolunteerFullDetail.fromJson(Map<String, dynamic> json) =>
      _$VolunteerFullDetailFromJson(json);

  VolunteerFullDetail copyWith(
          {String? name,
          String? image,
          int? rating,
          int? age,
          int? experience,
          int? totalAppointmentComplated,
          String? description,
          String? volunteerCode,
          String? elderlyCareCode,
          String? elderlyCareName,
          String? elderlyCareContactMobile,
          String? gender,
          VolunteerAddressModel? address}) =>
      VolunteerFullDetail(
          name: name ?? this.name,
          image: image ?? this.image,
          rating: rating ?? this.rating,
          age: age ?? this.age,
          experience: experience ?? this.experience,
          totalAppointmentComplated:
              totalAppointmentComplated ?? this.totalAppointmentComplated,
          description: description ?? this.description,
          volunteerCode: volunteerCode ?? this.volunteerCode,
          elderlyCareCode: elderlyCareCode ?? this.elderlyCareCode,
          elderlyCareContactMobile:
              elderlyCareContactMobile ?? this.elderlyCareContactMobile,
          elderlyCareName: elderlyCareName ?? this.elderlyCareName,
          gender: gender ?? this.gender,
          address: address ?? this.address);

  List<Object?> get props => <Object>[
        name,
        image,
        rating,
        age,
        experience,
        totalAppointmentComplated,
        description,
        volunteerCode,
        elderlyCareCode,
        elderlyCareName,
        elderlyCareContactMobile,
        gender,
        address
      ];
}
