import 'package:json_annotation/json_annotation.dart';
part 'request_otp_response.g.dart';

@JsonSerializable()
class RequestOtpResponse {
  const RequestOtpResponse({this.ref = 'tokl', this.token = ''});
  //convert from json
  factory RequestOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestOtpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RequestOtpResponseToJson(this);

  final String token;

  final String ref;

  RequestOtpResponse copyWith({String? token, String? ref}) =>
      RequestOtpResponse(token: token ?? this.token, ref: ref ?? this.ref);

  List<Object?> get props => <Object>[token, ref];
}
