import 'package:json_annotation/json_annotation.dart';
part 'verify_response.g.dart';

@JsonSerializable()
class VerifyResponse {
  const VerifyResponse({this.resetPasswordToken = ''});
  //convert from json
  factory VerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyResponseToJson(this);

  final String resetPasswordToken;

  VerifyResponse copyWith({String? resetPasswordToken}) => VerifyResponse(
      resetPasswordToken: resetPasswordToken ?? this.resetPasswordToken);

  List<Object?> get props => <Object>[resetPasswordToken];
}
