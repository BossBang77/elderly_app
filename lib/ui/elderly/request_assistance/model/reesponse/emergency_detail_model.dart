import 'package:health_application/ui/elderly/request_assistance/model/reesponse/user_profile_model.dart';
import 'package:health_application/ui/elderly/request_assistance/model/reesponse/volunteer_help_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emergency_detail_model.g.dart';

@JsonSerializable()
class EmergencyHelpDetailModel {
  const EmergencyHelpDetailModel(
      {this.addressFull = '',
      this.elderlyCareCode = '',
      this.elderlyCareName = '',
      this.latitude = 0,
      this.longitude = 0,
      this.profile = const UserProfileModel(),
      this.id = '',
      this.emergencyHelpers = const <VolunteerHelpDetailModel>[],
      this.status = ''});

  ///convert from json
  factory EmergencyHelpDetailModel.fromJson(Map<String, dynamic> json) =>
      _$EmergencyHelpDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$EmergencyHelpDetailModelToJson(this);
  final String id;
  final String status;
  final String elderlyCareCode;
  final String elderlyCareName;
  final String addressFull;
  final num latitude;
  final num longitude;
  final UserProfileModel profile;
  final List<VolunteerHelpDetailModel> emergencyHelpers;

  EmergencyHelpDetailModel get empty => EmergencyHelpDetailModel();

  EmergencyHelpDetailModel copyWith(
          {String? elderlyCareCode,
          String? elderlyCareName,
          String? addressFull,
          num? latitude,
          num? longitude,
          UserProfileModel? profile,
          List<VolunteerHelpDetailModel>? emergencyHelpers}) =>
      EmergencyHelpDetailModel(
          profile: profile ?? this.profile,
          emergencyHelpers: emergencyHelpers ?? this.emergencyHelpers,
          elderlyCareCode: elderlyCareCode ?? this.elderlyCareCode,
          elderlyCareName: elderlyCareName ?? this.elderlyCareName,
          addressFull: addressFull ?? this.addressFull,
          latitude: latitude ?? this.latitude,
          longitude: longitude ?? this.longitude);

  List<Object?> get props => <Object>[
        profile,
        elderlyCareCode,
        elderlyCareName,
        addressFull,
        latitude,
        longitude,
        emergencyHelpers
      ];
}
