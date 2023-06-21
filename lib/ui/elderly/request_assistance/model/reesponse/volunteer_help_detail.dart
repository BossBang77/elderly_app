import 'package:health_application/ui/elderly/request_assistance/model/reesponse/user_profile_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'volunteer_help_detail.g.dart';

@JsonSerializable()
class VolunteerHelpDetailModel {
  const VolunteerHelpDetailModel(
      {this.addressFull = '',
      this.elderlyCareCode = '',
      this.elderlyCareName = '',
      this.latitude = 0,
      this.longitude = 0,
      this.profile = const UserProfileModel(),
      this.profileId = '',
      this.volunteerCode = ''});

  ///convert from json
  factory VolunteerHelpDetailModel.fromJson(Map<String, dynamic> json) =>
      _$VolunteerHelpDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$VolunteerHelpDetailModelToJson(this);
  final String profileId;
  final String volunteerCode;
  final String elderlyCareCode;
  final String elderlyCareName;
  final String addressFull;
  final num latitude;
  final num longitude;
  final UserProfileModel profile;

  VolunteerHelpDetailModel get empty => VolunteerHelpDetailModel();

  VolunteerHelpDetailModel copyWith(
          {String? profileId,
          String? volunteerCode,
          String? elderlyCareCode,
          String? elderlyCareName,
          String? addressFull,
          num? latitude,
          num? longitude,
          UserProfileModel? profile}) =>
      VolunteerHelpDetailModel(
          profile: profile ?? this.profile,
          profileId: profileId ?? this.profileId,
          volunteerCode: volunteerCode ?? this.volunteerCode,
          elderlyCareCode: elderlyCareCode ?? this.elderlyCareCode,
          elderlyCareName: elderlyCareName ?? this.elderlyCareName,
          addressFull: addressFull ?? this.addressFull,
          latitude: latitude ?? this.latitude,
          longitude: longitude ?? this.longitude);

  List<Object?> get props => <Object>[
        profile,
        profileId,
        volunteerCode,
        elderlyCareCode,
        elderlyCareName,
        addressFull,
        latitude,
        longitude
      ];
}
