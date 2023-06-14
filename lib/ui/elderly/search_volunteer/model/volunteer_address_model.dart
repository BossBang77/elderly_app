import 'package:json_annotation/json_annotation.dart';

part 'volunteer_address_model.g.dart';

@JsonSerializable()
class VolunteerAddressModel {
  const VolunteerAddressModel(
      {this.addressNo = '',
      this.buildVillageName = '',
      this.country = '',
      this.district = '',
      this.location = '',
      this.postalCode = '',
      this.province = '',
      this.road = '',
      this.soi = '',
      this.subDistrict = '',
      this.type = ''});

  final String type;
  final String location;
  @JsonKey(
    name: 'address_no',
  )
  final String addressNo;
  @JsonKey(
    name: 'build_village_name',
  )
  final String buildVillageName;
  final String soi;
  final String road;
  @JsonKey(
    name: 'sub_district',
  )
  final String subDistrict;
  final String district;
  final String province;
  @JsonKey(
    name: 'postal_code',
  )
  final String postalCode;
  final String country;

  String getfullAddress() {
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

  //convert from json
  factory VolunteerAddressModel.fromJson(Map<String, dynamic> json) =>
      _$VolunteerAddressModelFromJson(json);

  List<Object?> get props => <Object>[
        type,
        location,
        addressNo,
        buildVillageName,
        soi,
        road,
        subDistrict,
        district,
        province,
        postalCode,
        country
      ];
}
