import 'package:json_annotation/json_annotation.dart';
part 'verify_reset_password.g.dart';

@JsonSerializable()
class VertifyResetPassword {
  const VertifyResetPassword(
      {this.username = '', this.code = '', this.token = ''});

  factory VertifyResetPassword.fromJson(Map<String, dynamic> json) =>
      _$VertifyResetPasswordFromJson(json);
  Map<String, dynamic> toJson() => _$VertifyResetPasswordToJson(this);

  final String username;
  final String token;
  final String code;

  VertifyResetPassword copyWith({String? username}) =>
      VertifyResetPassword(username: username ?? this.username);

  List<Object?> get props => <Object>[username, token, code];
}
