import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_application/repository/login_repos.dart';
import 'package:health_application/ui/elderly/elderly_address/model/location_model.dart';

import '../../../../repository/logout_repos.dart';
import '../../../base/model/failure.dart';
import '../../../google_map/locationsModel.dart';
import '../../../register_profile/model/addresses_detail.dart';
import '../../../register_profile/model/register_model.dart';

part 'elderly_address_event.dart';
part 'elderly_address_state.dart';

class ElderlyAddressBloc
    extends Bloc<ElderlyAddressEvent, ElderlyAddressState> {
  ElderlyAddressBloc() : super(ElderlyAddressInitial()) {
    LoginRepository _loginRepository = LoginRepository();
    Locations _location = Locations();
    on<ElderlyAddressEvent>((event, emit) async {
      if (event is GetProfile) {
        emit(state.copyWith(isLoading: true));
        var userProfile = await _loginRepository.getPfofile();
        userProfile.fold((Failure error) async {
          emit(state.copyWith(userProfile: RegisterModel(), isLoading: false));
        }, (RegisterModel res) async {
          RegisterModel profile = res;
          emit(state.copyWith(userProfile: profile, isLoading: false));
        });
      }

      if (event is LocationChange) {
        emit(state.copyWith(isLoading: true));
        LocationModel locate = event.location;
        if (event.type == ManageAddressType.add) {
          var res = await _location.getCurrentUserLocation().whenComplete(() {
            emit(state.copyWith(
                isLoading: false,
                location: LocationModel(
                    latitude: _location.latitude,
                    longitude: _location.longtitude,
                    locationName: _location.nameAddress),
                addressState: ChangeAddressState.initial));
          });
        } else {
          var currentAddress = await _location
              .getAddressDetailModel(LatLng(locate.latitude, locate.longitude));
          emit(state.copyWith(
              isLoading: false,
              location: LocationModel(
                  latitude: currentAddress.latitude,
                  longitude: currentAddress.longitude,
                  locationName: currentAddress.fullAddress),
              addressState: ChangeAddressState.initial));
        }
      }
      if (event is onAcceptLocation) {
        emit(state.copyWith(isLoading: true));
        var currentAddress = await Locations().getAddressDetailModel(
            LatLng(state.location.latitude, state.location.longitude));
        var profile = state.userProfile;
        var listAddress = [...state.userProfile.addresses];

        if (event.type == ManageAddressType.add) {
          listAddress.add(currentAddress);
        } else if (event.type == ManageAddressType.edit) {
          listAddress[event.index] = currentAddress;
        } else if (event.type == ManageAddressType.delete) {
          listAddress.removeAt(event.index);
        }
        profile = profile.copyWith(addresses: listAddress);
        var updateProfile = await _loginRepository.updatePfofile(profile);
        updateProfile.fold((l) async {
          emit(state.copyWith(
              isLoading: false,
              addressState: ChangeAddressState.changeAddressFail));
        }, (r) async {
          emit(state.copyWith(
              isLoading: false,
              addressState: ChangeAddressState.changeAddressSuccess));
        });
      }

      if (event is ManageAddress) {
        emit(state.copyWith(manageType: event.type));
      }

      if (event is ResetState) {
        emit(state.copyWith(addressState: ChangeAddressState.initial));
      }
    });
  }
}
