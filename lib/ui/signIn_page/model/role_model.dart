import 'package:json_annotation/json_annotation.dart';
part 'role_model.g.dart';

@JsonSerializable()
class RoleModel {
  const RoleModel({this.role = ''});
  //convert from json
  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoleModelToJson(this);

  @JsonKey(
    name: 'role',
  )
  final String role;

  RoleModel copyWith({String? role}) => RoleModel(role: role ?? this.role);

  List<Object?> get props => <Object>[role];
}
