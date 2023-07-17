import 'package:json_annotation/json_annotation.dart';
part 'request_reset_password.g.dart';

@JsonSerializable()
class RequestResetPasswordModel {
  const RequestResetPasswordModel({this.username = ''});
  //convert from json
  factory RequestResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$RequestResetPasswordModelFromJson(json);
  Map<String, dynamic> toJson() => _$RequestResetPasswordModelToJson(this);

  final String username;

  RequestResetPasswordModel copyWith({String? username}) =>
      RequestResetPasswordModel(username: username ?? this.username);

  List<Object?> get props => <Object>[username];
}
