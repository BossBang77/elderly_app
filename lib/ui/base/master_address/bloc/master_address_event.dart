part of 'master_address_bloc.dart';

abstract class MasterAddressEvent extends Equatable {
  const MasterAddressEvent();

  @override
  List<Object> get props => [];
}

class LoadProvince extends MasterAddressEvent {
  const LoadProvince();
}

class LoadMasterDistrict extends MasterAddressEvent {
  final String provinceCode;
  const LoadMasterDistrict({this.provinceCode = ''});
  @override
  List<Object> get props => [provinceCode];
}

class LoadMasterSubDistrict extends MasterAddressEvent {
  final String districtCode;
  const LoadMasterSubDistrict({this.districtCode = ''});
  @override
  List<Object> get props => [districtCode];
}

class LoadInitialDistricSubDistrict extends MasterAddressEvent {
  final String provinceTitle;
  final String districtTitle;
  final String subDistrictTitle;

  const LoadInitialDistricSubDistrict(
      {required this.districtTitle,
      required this.provinceTitle,
      required this.subDistrictTitle});

  @override
  List<Object> get props => [districtTitle, subDistrictTitle, provinceTitle];
}
