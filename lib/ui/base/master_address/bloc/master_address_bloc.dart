import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/master_data_repos.dart';
import 'package:health_application/ui/base/master_address/model/address_detail.dart';
import 'package:health_application/ui/extension/master_data_extension.dart';
import 'package:http/http.dart';

part 'master_address_event.dart';
part 'master_address_state.dart';

class MasterAddressBloc extends Bloc<MasterAddressEvent, MasterAddressState> {
  MasterAddressBloc() : super(MasterAddressInitial()) {
    MasterDataRepository _masterDataService = MasterDataRepository();
    Future onGetSubdistrict(LoadInitialDistricSubDistrict event,
        Emitter<MasterAddressState> emit) async {
      var districtCode = state.district.getCodeByName(event.districtTitle);
      var subdirtrict =
          await _masterDataService.loadMasterSubDistrict(districtCode);
      subdirtrict.fold((err) {
        emit(state.copyWith(
          isLoading: false,
          subDistrict: [],
          zipCode: [],
        ));
      }, (subdistrict) {
        emit(state.copyWith(
            isLoading: false,
            subDistrict: subdistrict.data,
            zipCode: subdistrict.data.map((e) => e.zipcode).toList()));
      });
    }

    on<MasterAddressEvent>((event, emit) async {
      if (event is LoadProvince) {
        emit(state.copyWith(isLoading: true));

        var provinceRes = await _masterDataService.loadMasterProvince();
        provinceRes.fold((err) {
          emit(state.copyWith(isLoading: false, province: []));
        }, (res) {
          emit(state.copyWith(isLoading: false, province: res.data));
        });
      }

      if (event is LoadMasterDistrict) {
        emit(state.copyWith(isLoading: true, district: []));

        var provinceRes =
            await _masterDataService.loadMasterDistrict(event.provinceCode);
        provinceRes.fold((err) {
          emit(state.copyWith(isLoading: false, district: []));
        }, (res) {
          emit(state.copyWith(isLoading: false, district: res.data));
        });
      }

      if (event is LoadMasterSubDistrict) {
        emit(state.copyWith(isLoading: true, subDistrict: [], zipCode: []));

        var provinceRes =
            await _masterDataService.loadMasterSubDistrict(event.districtCode);
        provinceRes.fold((err) {
          emit(state.copyWith(isLoading: false, subDistrict: [], zipCode: []));
        }, (res) {
          emit(state.copyWith(
              isLoading: false,
              subDistrict: res.data,
              zipCode: res.data.map((e) => e.zipcode).toList()));
        });
      }

      if (event is LoadInitialDistricSubDistrict) {
        String provinceCode = state.province.getCodeByName(event.provinceTitle);

        await _masterDataService
            .loadMasterDistrict(provinceCode)
            .then((value) => value.fold((err) {
                  emit(state.copyWith(isLoading: false, district: []));
                }, (district) {
                  emit(state.copyWith(
                      isLoading: false, district: district.data));
                }))
            .whenComplete(() async => await onGetSubdistrict(event, emit));
      }
    });
  }
}
