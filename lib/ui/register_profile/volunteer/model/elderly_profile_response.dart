import 'package:health_application/ui/register_profile/volunteer/model/elderly_profile_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'elderly_profile_response.g.dart';

@JsonSerializable()
class ElderlyProfileResponse {
  const ElderlyProfileResponse({
    this.code = '',
    this.message = '',
    this.data = const ElderlyProfileModel(),
  });

  ///convert from json
  factory ElderlyProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ElderlyProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ElderlyProfileResponseToJson(this);

  final String code;
  final String message;
  final ElderlyProfileModel data;
}
