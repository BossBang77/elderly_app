import 'package:json_annotation/json_annotation.dart';
part 'elderly_detail_model.g.dart';

@JsonSerializable()
class ElderlyDetailModel {
  const ElderlyDetailModel(
      {this.age = 0,
      this.weight = 0,
      this.gender = '',
      this.height = 0,
      this.image = '',
      this.mobileNumber = '',
      this.name = ''});

  ///convert from json
  factory ElderlyDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ElderlyDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$ElderlyDetailModelToJson(this);
  final String mobileNumber;
  final String name;
  final String image;
  final String gender;
  final num age;
  final num weight;
  final num height;

  ElderlyDetailModel get empty => ElderlyDetailModel();

  ElderlyDetailModel copyWith(
          {String? mobileNumber,
          String? name,
          String? image,
          String? gender,
          num? age,
          num? weight,
          num? height}) =>
      ElderlyDetailModel(
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
