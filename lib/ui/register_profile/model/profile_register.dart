import 'package:json_annotation/json_annotation.dart';
part 'profile_register.g.dart';

@JsonSerializable()
class ProfileRegisterModel {
  const ProfileRegisterModel(
      {this.age = 0,
      this.gender = '',
      this.height = 0,
      this.name = '',
      this.weight = 0});
  //convert from json
  factory ProfileRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileRegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileRegisterModelToJson(this);

  @JsonKey(
    name: 'name',
  )
  final String name;

  @JsonKey(
    name: 'gender',
  )
  final String gender;

  @JsonKey(
    name: 'weight',
  )
  final int weight;

  @JsonKey(
    name: 'height',
  )
  final int height;

  @JsonKey(
    name: 'age',
  )
  final int age;

  ProfileRegisterModel copyWith(
          {String? name, String? gender, int? age, int? weight, int? height}) =>
      ProfileRegisterModel(
          name: name ?? this.name,
          gender: gender ?? this.gender,
          height: height ?? this.height,
          age: age ?? this.age,
          weight: weight ?? this.weight);

  List<Object?> get props => <Object>[name, gender, age, weight, height];
}
