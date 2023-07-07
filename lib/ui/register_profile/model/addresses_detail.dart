import 'package:json_annotation/json_annotation.dart';

part 'addresses_detail.g.dart';

@JsonSerializable()
class AddressDetailModel {
  const AddressDetailModel(
      {this.addressNo = '',
      this.buildVillageName = '',
      this.country = '',
      this.district = '',
      this.isDefault = false,
      this.latitude = 0,
      this.longitude = 0,
      this.postalCode = '',
      this.province = '',
      this.road = '',
      this.soi = '',
      this.subDistrict = '',
      this.type = ''});

  ///convert from json
  factory AddressDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressDetailModelToJson(this);
  final bool isDefault;
  final String type;
  final String addressNo;
  final String buildVillageName;
  final String soi;
  final String road;
  final String subDistrict;
  final String district;
  final String province;
  final String postalCode;
  final String country;
  final double latitude;
  final double longitude;

  String get fullAddress {
    return addressNo +
        buildVillageName +
        soi +
        road +
        subDistrict +
        district +
        province +
        postalCode +
        country;
  }

  List<Object?> get props => <Object>[
        isDefault,
        type,
        addressNo,
        buildVillageName,
        soi,
        road,
        subDistrict,
        district,
        province,
        postalCode,
        country,
        latitude,
        longitude
      ];
}
