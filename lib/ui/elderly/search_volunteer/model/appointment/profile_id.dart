import 'package:json_annotation/json_annotation.dart';

part 'profile_id.g.dart';

@JsonSerializable()
class ProfileIdModel {
  const ProfileIdModel({this.profileId = ''});

  final String profileId;

  //convert from json
  factory ProfileIdModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileIdModelFromJson(json);

  ProfileIdModel copyWith({String? profileId}) =>
      ProfileIdModel(profileId: profileId ?? this.profileId);

  Map<String, dynamic> toJson() => _$ProfileIdModelToJson(this);

  List<Object?> get props => <Object>[profileId];
}
