import 'package:health_application/ui/volunteer/request_assistance_detail/model/elderly_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assitance_model.g.dart';

@JsonSerializable()
class AssitanceDetailModel {
  const AssitanceDetailModel(
      {this.addressFull = '',
      this.latitude = 0,
      this.longitude = 0,
      this.profile = const ElderlyDetailModel(),
      this.id = '',
      this.status = '',
      this.isMyHelp = false});

  ///convert from json
  factory AssitanceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AssitanceDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$AssitanceDetailModelToJson(this);
  final String id;
  final String status;
  final String addressFull;
  final num latitude;
  final num longitude;
  final ElderlyDetailModel profile;
  final bool isMyHelp;

  AssitanceDetailModel get empty => AssitanceDetailModel();

  AssitanceDetailModelcopyWith(
          {String? addressFull,
          num? latitude,
          num? longitude,
          ElderlyDetailModel? profile,
          bool? isMyHelp}) =>
      AssitanceDetailModel(
          profile: profile ?? this.profile,
          addressFull: addressFull ?? this.addressFull,
          latitude: latitude ?? this.latitude,
          longitude: longitude ?? this.longitude,
          isMyHelp: isMyHelp ?? this.isMyHelp);

  List<Object?> get props =>
      <Object>[addressFull, latitude, longitude, profile, isMyHelp];
}
