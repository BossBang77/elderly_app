import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {
  const UserProfileModel(
      {this.age = 0,
      this.weight = 0,
      this.gender = '',
      this.height = 0,
      this.image = '',
      this.mobileNumber = '',
      this.name = ''});

  ///convert from json
  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
  final String mobileNumber;
  final String name;
  final String image;
  final String gender;
  final num age;
  final num weight;
  final num height;

  UserProfileModel get empty => UserProfileModel();

  UserProfileModel copyWith(
          {String? mobileNumber,
          String? name,
          String? image,
          String? gender,
          num? age,
          num? weight,
          num? height}) =>
      UserProfileModel(
          mobileNumber: mobileNumber ?? this.mobileNumber,
          name: name ?? this.name,
          image: image ?? this.image,
          gender: gender ?? this.gender,
          age: age ?? this.age,
          weight: weight ?? this.weight,
          height: height ?? this.height);

  List<Object?> get props =>
      <Object>[mobileNumber, name, image, gender, age, weight, height];
}
