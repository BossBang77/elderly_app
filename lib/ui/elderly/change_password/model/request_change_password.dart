import 'package:json_annotation/json_annotation.dart';

part 'request_change_password.g.dart';

@JsonSerializable()
class RequestChangePassword {
  const RequestChangePassword(
      {this.confirmPassword = '',
      this.newPassword = '',
      this.oldPassword = ''});
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  RequestChangePassword copyWith(
      {String? oldPassword, String? newPassword, String? confirmPassword}) {
    return RequestChangePassword(
        confirmPassword: confirmPassword ?? this.confirmPassword,
        newPassword: newPassword ?? this.newPassword,
        oldPassword: oldPassword ?? this.oldPassword);
  }

  factory RequestChangePassword.fromJson(Map<String, dynamic> json) =>
      _$RequestChangePasswordFromJson(json);
  Map<String, dynamic> toJson() => _$RequestChangePasswordToJson(this);

  List<Object?> get props =>
      <Object>[oldPassword, newPassword, confirmPassword];
}
