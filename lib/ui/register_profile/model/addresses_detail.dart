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
      this.type = '',
      this.floor = '',
      this.moo = '',
      this.roomNo = ''});

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
  final String roomNo;
  final String moo;
  final String floor;

  String get fullAddress {
    return addressNo +
        roomNo +
        floor +
        moo +
        buildVillageName +
        soi +
        road +
        subDistrict +
        district +
        province +
        postalCode +
        country;
  }

  String get fullAddressWithPrefix {
    String addressNoPrefix = addressNo.isNotEmpty ? ' เลขที่ ' : '';
    String roomNoPrefix = roomNo.isNotEmpty ? ' เลขที่ห้อง ' : '';
    String floorPrefix = floor.isNotEmpty ? ' ชั้น ' : '';
    String mooPrefix = moo.isNotEmpty ? ' หมู่ ' : '';
    String buildVillageNamePrefix =
        buildVillageName.isNotEmpty ? ' หมู่บ้าน' : '';
    String soiPrefix = soi.isNotEmpty ? ' ซอย' : '';
    String roadPrefix = road.isNotEmpty ? ' ถนน' : '';
    String subDistricPrefix = subDistrict.isNotEmpty ? ' ตำบล' : '';
    String districPrefix = district.isNotEmpty ? ' อำเภอ' : '';
    String provincePrefix = province.isNotEmpty ? ' จังหวัด' : '';
    return addressNoPrefix +
        addressNo +
        roomNoPrefix +
        roomNo +
        floorPrefix +
        floor +
        mooPrefix +
        moo +
        buildVillageNamePrefix +
        buildVillageName +
        soiPrefix +
        soi +
        roadPrefix +
        road +
        subDistricPrefix +
        subDistrict +
        districPrefix +
        district +
        provincePrefix +
        province +
        ' ' +
        postalCode +
        country;
  }

  AddressDetailModel copyWith({
    bool? isDefault,
    String? type,
    String? addressNo,
    String? buildVillageName,
    String? soi,
    String? road,
    String? subDistrict,
    String? district,
    String? province,
    String? postalCode,
    String? country,
    double? latitude,
    double? longitude,
    String? roomNo,
    String? moo,
    String? floor,
  }) {
    return AddressDetailModel(
        isDefault: isDefault ?? this.isDefault,
        type: type ?? this.type,
        addressNo: addressNo ?? this.addressNo,
        buildVillageName: buildVillageName ?? this.buildVillageName,
        soi: soi ?? this.soi,
        road: road ?? this.road,
        subDistrict: subDistrict ?? this.subDistrict,
        district: district ?? this.district,
        province: province ?? this.province,
        postalCode: postalCode ?? this.postalCode,
        country: country ?? this.country,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        roomNo: roomNo ?? this.roomNo,
        moo: moo ?? this.moo,
        floor: floor ?? this.floor);
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
        longitude,
        roomNo,
        floor,
        moo
      ];
  AddressDetailModel get empty => AddressDetailModel();
}
