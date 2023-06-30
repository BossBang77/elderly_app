import 'package:json_annotation/json_annotation.dart';
part 'profile_register.g.dart';

@JsonSerializable()
class ProfileRegisterModel {
  const ProfileRegisterModel(
      {this.age = 0,
      this.gender = '',
      this.height = 0,
      this.name = '',
      this.weight = 0,
      this.citizenId = '',
      this.birthDate = '',
      this.image = ''});
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

  @JsonKey(
    name: 'citizenId',
  )
  final String citizenId;

  @JsonKey(
    name: 'birthDate',
  )
  final String birthDate;
  @JsonKey(
    name: 'image',
  )
  final String image;

  ProfileRegisterModel copyWith(
          {String? name,
          String? gender,
          int? age,
          int? weight,
          int? height,
          String? citizenId,
          String? birthDate,
          String? image}) =>
      ProfileRegisterModel(
          name: name ?? this.name,
          gender: gender ?? this.gender,
          height: height ?? this.height,
          age: age ?? this.age,
          weight: weight ?? this.weight,
          citizenId: citizenId ?? this.citizenId,
          birthDate: birthDate ?? this.birthDate,
          image: image ?? this.image);

  List<Object?> get props =>
      <Object>[name, gender, age, weight, height, citizenId, birthDate, image];
}
