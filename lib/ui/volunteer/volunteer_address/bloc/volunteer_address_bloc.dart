import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:health_application/repository/login_repos.dart';
import 'package:health_application/ui/base/widget/title_header.dart';
import 'package:health_application/ui/register_profile/model/addresses_detail.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/signIn_page/login/login_page.dart';

part 'volunteer_address_event.dart';
part 'volunteer_address_state.dart';

class VolunteerAddressBloc
    extends Bloc<VolunteerAddressEvent, VolunteerAddressState> {
  LoginRepository _loginRepository = LoginRepository();
  VolunteerAddressBloc() : super(VolunteerAddressInitial()) {
    on<VolunteerAddressEvent>((event, emit) async {
      if (event is InitialData) {
        emit(VolunteerAddressState.initial());
        emit(state.copyWith(
            profile: event.profile, currentChange: event.profile));
      }

      if (event is EditOrAddForm) {
        var profile = event.profile;
        if (getAddress([...profile.addresses], event.type) == null) {
          List<AddressDetailModel> masterAddress = [...profile.addresses];
          masterAddress.add(AddressDetailModel(type: event.type.name));
          profile = profile.copyWith(addresses: masterAddress);
        }

        emit(state.copyWith(
            section: VoluteerAddressSection.fillVolunteerAddress,
            currentChange: profile,
            typeChange: event.type));
      }

      if (event is ChangeSection) {
        emit(state.copyWith(section: VoluteerAddressSection.summaryAddress));
      }

      if (event is ChangeForm) {
        emit(mappingFill(event));
      }

      if (event is SubmitForm) {
        emit(state.copyWith(isLoading: true));

        var submit = await _loginRepository.updatePfofile(state.currentChange);
        submit.fold((err) {
          emit(state.copyWith(
              isLoading: false, submitStatus: SubmitStatus.fail));
        }, (res) {
          emit(state.copyWith(
              isLoading: false, submitStatus: SubmitStatus.success));
        });
      }

      if (event is ResetSubmitForm) {
        emit(state.copyWith(submitStatus: SubmitStatus.initial));
      }

      if (event is ConfirmAddress) {
        emit(state.copyWith(profile: state.currentChange));
        add(ChangeSection(section: VoluteerAddressSection.summaryAddress));
      }
    });
  }
  VolunteerAddressState mappingFill(ChangeForm event) {
    var fillType = event.fillType;
    var masterProfile = state.currentChange;
    var addList = [...masterProfile.addresses];
    var currentForm = getAddress(addList, state.typeChange);
    var indexChange =
        addList.indexWhere((element) => element.type == state.typeChange.name);
    bool selectSameRegister = state.selectSameRegister;

    switch (fillType) {
      // TODO abount master data
      case TypeAddress.addressNo:
        currentForm = currentForm!.copyWith(addressNo: event.value);
        break;
      case TypeAddress.buildingName:
        currentForm = currentForm!.copyWith(buildVillageName: event.value);
        break;
      case TypeAddress.district:

      case TypeAddress.floor:
        currentForm = currentForm!.copyWith(floor: event.value);
        break;
      case TypeAddress.moo:
        currentForm = currentForm!.copyWith(moo: event.value);
        break;
      case TypeAddress.postalCode:
      case TypeAddress.province:
      case TypeAddress.road:
        currentForm = currentForm!.copyWith(road: event.value);
        break;
      case TypeAddress.roomNo:
        currentForm = currentForm!.copyWith(roomNo: event.value);
        break;
      case TypeAddress.soi:
        currentForm = currentForm!.copyWith(soi: event.value);
        break;
      case TypeAddress.subdistrict:
      case TypeAddress.selectSameRegister:
        AddressDetailModel registerAddress = event.value;
        if (selectSameRegister) {
          registerAddress = AddressDetailModel();
        }

        registerAddress = registerAddress.copyWith(type: state.typeChange.name);
        currentForm = registerAddress;
        selectSameRegister = !selectSameRegister;
        break;
      default:
    }

    if (indexChange >= 0) {
      addList[indexChange] = currentForm ?? AddressDetailModel();
      masterProfile = masterProfile.copyWith(addresses: addList);
    }

    return state.copyWith(
        currentChange: masterProfile, selectSameRegister: selectSameRegister);
  }
}

AddressDetailModel? getAddress(
    List<AddressDetailModel> addressList, AddressType type) {
  var searchAddress = addressList.firstWhere(
    (element) => element.type == type.name,
    orElse: () => AddressDetailModel(),
  );

  if (searchAddress.type.isEmpty) {
    return null;
  } else {
    return searchAddress;
  }
}
