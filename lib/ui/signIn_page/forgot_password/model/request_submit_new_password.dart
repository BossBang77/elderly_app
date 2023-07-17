import 'package:json_annotation/json_annotation.dart';
part 'request_submit_new_password.g.dart';

@JsonSerializable()
class RequestSubmitNewPasswordModel {
  const RequestSubmitNewPasswordModel(
      {this.username = '', this.password = '', this.resetPasswordToken = ''});
  //convert from json
  factory RequestSubmitNewPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$RequestSubmitNewPasswordModelFromJson(json);
  Map<String, dynamic> toJson() => _$RequestSubmitNewPasswordModelToJson(this);

  final String username;
  final String password;
  final String resetPasswordToken;

  RequestSubmitNewPasswordModel copyWith(
          {String? username, String? password, String? resetPasswordToken}) =>
      RequestSubmitNewPasswordModel(
          username: username ?? this.username,
          password: password ?? this.password,
          resetPasswordToken: resetPasswordToken ?? this.resetPasswordToken);

  List<Object?> get props => <Object>[username, password, resetPasswordToken];
}
