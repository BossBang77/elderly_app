part of 'master_address_bloc.dart';

class MasterAddressState extends Equatable {
  const MasterAddressState(
      {this.province = const <AddressDetail>[],
      this.district = const <AddressDetail>[],
      this.subDistrict = const <AddressDetail>[],
      this.isLoading = false,
      this.zipCode = const <String>[]});
  final List<AddressDetail> province;
  final List<AddressDetail> district;
  final List<AddressDetail> subDistrict;
  final bool isLoading;
  final List<String> zipCode;

  MasterAddressState copyWith(
      {List<AddressDetail>? province,
      List<AddressDetail>? district,
      List<AddressDetail>? subDistrict,
      bool? isLoading,
      List<String>? zipCode}) {
    return MasterAddressState(
        district: district ?? this.district,
        subDistrict: subDistrict ?? this.subDistrict,
        province: province ?? this.province,
        isLoading: isLoading ?? this.isLoading,
        zipCode: zipCode ?? this.zipCode);
  }

  @override
  List<Object> get props =>
      [province, district, subDistrict, isLoading, zipCode];
}

class MasterAddressInitial extends MasterAddressState {}
