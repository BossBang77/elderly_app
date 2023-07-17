import 'package:json_annotation/json_annotation.dart';

part 'address_detail.g.dart';

@JsonSerializable()
class AddressDetail {
  const AddressDetail(
      {this.code = '',
      this.districtCode = '',
      this.name = '',
      this.zipcode = ''});

  ///convert from json
  factory AddressDetail.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailFromJson(json);
  Map<String, dynamic> toJson() => _$AddressDetailToJson(this);
  final String code;
  final String name;
  final String districtCode;
  final String zipcode;

  AddressDetail copyWith(
          {String? code,
          String? name,
          String? districtCode,
          String? zipcode}) =>
      AddressDetail(
          code: code ?? this.code,
          name: name ?? this.name,
          districtCode: districtCode ?? this.districtCode,
          zipcode: zipcode ?? this.zipcode);

  List<Object?> get props => <Object>[code, name, districtCode, zipcode];
}
