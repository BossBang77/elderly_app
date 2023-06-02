import 'package:health_application/ui/signIn_page/model/role_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  const LoginModel(
      {this.accessToken = '',
      this.refreshToken = '',
      this.role = const <RoleModel>[],
      this.username = ''});
  //convert from json
  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @JsonKey(
    name: 'accessToken',
  )
  final String accessToken;

  @JsonKey(
    name: 'refreshToken',
  )
  final String refreshToken;

  @JsonKey(
    name: 'role',
  )
  final List<RoleModel> role;

  @JsonKey(
    name: 'username',
  )
  final String username;

  LoginModel copyWith(
          {String? accessToken,
          String? refreshToken,
          List<RoleModel>? role,
          String? username}) =>
      LoginModel(
          accessToken: accessToken ?? this.accessToken,
          refreshToken: refreshToken ?? this.refreshToken,
          role: role ?? this.role,
          username: username ?? this.username);

  List<Object?> get props =>
      <Object>[accessToken, refreshToken, role, username];
}
