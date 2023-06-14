import 'package:health_application/ui/register_profile/model/profile_register.dart';
import 'package:health_application/ui/register_profile/model/sub_menu_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'register_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterModel {
  const RegisterModel(
      {this.allergicFoods = const <SubMenuModel>[],
      this.congenitalDisease = const <SubMenuModel>[],
      this.volunteerCode = '',
      this.elderlyCareCode = '',
      this.password = '',
      this.username = '',
      this.profile = const ProfileRegisterModel(),
      this.role = ''});
  //convert from json
  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);

  @JsonKey(
    name: 'role',
  )
  final String role;

  @JsonKey(
    name: 'username',
  )
  final String username;

  @JsonKey(
    name: 'password',
  )
  final String password;

  @JsonKey(
    name: 'volunteerCode',
  )
  final String volunteerCode;

  @JsonKey(
    name: 'elderlyCareCode',
  )
  final String elderlyCareCode;

  @JsonKey(
    name: 'profile',
  )
  final ProfileRegisterModel profile;

  @JsonKey(
    name: 'congenitalDisease',
  )
  final List<SubMenuModel> congenitalDisease;
  @JsonKey(
    name: 'allergicFoods',
  )
  final List<SubMenuModel> allergicFoods;

  RegisterModel copyWith(
          {String? role,
          String? username,
          String? password,
          String? volunteerCode,
          String? elderlyCareCode,
          ProfileRegisterModel? profile,
          List<SubMenuModel>? congenitalDisease,
          List<SubMenuModel>? allergicFoods}) =>
      RegisterModel(
          role: role ?? this.role,
          username: username ?? this.username,
          password: password ?? this.password,
          volunteerCode: volunteerCode ?? this.volunteerCode,
          elderlyCareCode: elderlyCareCode ?? this.elderlyCareCode,
          profile: profile ?? this.profile,
          congenitalDisease: congenitalDisease ?? this.congenitalDisease,
          allergicFoods: allergicFoods ?? this.allergicFoods);

  List<Object?> get props => <Object>[
        allergicFoods,
        congenitalDisease,
        password,
        profile,
        username,
        role,
        elderlyCareCode
      ];
}
