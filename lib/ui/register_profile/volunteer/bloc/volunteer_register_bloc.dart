import 'dart:convert';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/repository/register_repos.dart';
import 'package:health_application/ui/base/encrypt/encrypt.dart';
import 'package:health_application/ui/base/img_picker/image_picker.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/register_profile/model/addresses_detail.dart';
import 'package:health_application/ui/register_profile/model/profile_register.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/register_profile/volunteer/model/document_model.dart';
import 'package:health_application/ui/register_profile/volunteer/model/picture_detail_model.dart';
import 'package:image_picker/image_picker.dart';

part 'volunteer_register_event.dart';
part 'volunteer_register_state.dart';

class VolunteerRegisterBloc
    extends Bloc<VolunteerRegisterEvent, VolunteerRegisterState> {
  VolunteerRegisterBloc() : super(VolunteerRegisterState.initial()) {}
  final RegisterRepository _registerRepository = RegisterRepository();

  @override
  Stream<VolunteerRegisterState> mapEventToState(
      VolunteerRegisterEvent event) async* {
    if (event is UpdateValue) {
      var registerData = state.registerData;
      var profile = state.registerData.profile;
      var addList = registerData.addresses;
      var documentUpload = state.documentModel;

      var currentForm = getAddress(addList, AddressType.CONTACT_ADDRESS);
      switch (event.type) {
        case FormFieldType.name:
          profile = profile.copyWith(name: event.value);
          registerData = registerData.copyWith(profile: profile);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.cid:
          profile = profile.copyWith(citizenId: event.value);
          registerData = registerData.copyWith(profile: profile);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.sex:
          profile = profile.copyWith(gender: event.value);
          registerData = registerData.copyWith(profile: profile);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.birthDate:
          profile = profile.copyWith(birthDate: event.value);
          registerData = registerData.copyWith(profile: profile);
          yield state.copyWth(registerData: registerData);
          break;

        case FormFieldType.addressNo:
          currentForm = currentForm!.copyWith(addressNo: event.value);
          registerData = registerData.copyWith(addresses: [currentForm]);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.buildingName:
          currentForm = currentForm!.copyWith(buildVillageName: event.value);
          registerData = registerData.copyWith(addresses: [currentForm]);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.district:
          currentForm = currentForm!
              .copyWith(district: event.value, subDistrict: '', postalCode: '');
          registerData = registerData.copyWith(addresses: [currentForm]);
          yield state.copyWth(registerData: registerData);
          break;

        case FormFieldType.floor:
          currentForm = currentForm!.copyWith(floor: event.value);
          registerData = registerData.copyWith(addresses: [currentForm]);
          yield state.copyWth(registerData: registerData);

          break;
        case FormFieldType.moo:
          currentForm = currentForm!.copyWith(moo: event.value);
          registerData = registerData.copyWith(addresses: [currentForm]);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.postalCode:
          currentForm = currentForm!.copyWith(postalCode: event.value);
          registerData = registerData.copyWith(addresses: [currentForm]);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.province:
          currentForm = currentForm!.copyWith(
              province: event.value,
              district: '',
              subDistrict: '',
              postalCode: '');
          registerData = registerData.copyWith(addresses: [currentForm]);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.road:
          currentForm = currentForm!.copyWith(road: event.value);
          registerData = registerData.copyWith(addresses: [currentForm]);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.roomNo:
          currentForm = currentForm!.copyWith(roomNo: event.value);
          registerData = registerData.copyWith(addresses: [currentForm]);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.soi:
          currentForm = currentForm!.copyWith(soi: event.value);
          registerData = registerData.copyWith(addresses: [currentForm]);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.subdistrict:
          currentForm =
              currentForm!.copyWith(subDistrict: event.value, postalCode: '');
          registerData = registerData.copyWith(addresses: [currentForm]);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.addAddress:
          if (currentForm == null) {
            registerData = registerData.copyWith(addresses: [
              AddressDetailModel(type: AddressType.CONTACT_ADDRESS.name)
            ]);
          }

          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.experience:
          profile =
              profile.copyWith(experience: int.tryParse(event.value) ?? 0);
          registerData = registerData.copyWith(profile: profile);
          yield state.copyWth(registerData: registerData);
          break;
        case FormFieldType.uploadCID:
          var idCardMol = documentUpload.IDCard;
          idCardMol =
              idCardMol.copyWith(imgPath: event.value, sized: event.otherVal);
          documentUpload = documentUpload.copyWith(IDCard: idCardMol);
          yield state.copyWth(documentModel: documentUpload);
          break;
        case FormFieldType.uploadCIDCouple:
          var cidCouple = documentUpload.IDCardCouple;
          cidCouple =
              cidCouple.copyWith(imgPath: event.value, sized: event.otherVal);
          documentUpload = documentUpload.copyWith(IDCardCouple: cidCouple);
          yield state.copyWth(documentModel: documentUpload);
          break;

        case FormFieldType.uploadVolunteerCard:
          var volunteerCard = documentUpload.volunteerCard;
          volunteerCard = volunteerCard.copyWith(
              imgPath: event.value, sized: event.otherVal);
          documentUpload =
              documentUpload.copyWith(volunteerCard: volunteerCard);
          yield state.copyWth(documentModel: documentUpload);
          break;
        case FormFieldType.uploadVolunteerCardCouple:
          var volunteerCardCouple = documentUpload.volunteerCardCouple;
          volunteerCardCouple = volunteerCardCouple.copyWith(
              imgPath: event.value, sized: event.otherVal);
          documentUpload =
              documentUpload.copyWith(volunteerCardCouple: volunteerCardCouple);
          yield state.copyWth(documentModel: documentUpload);
          break;
      }
    }

    if (event is InitialForm) {
      yield VolunteerRegisterState.initial();
      yield state.copyWth(registerData: event.data);
    }

    if (event is DefaultStatus) {
      yield state.copyWth(status: RegisterStatus.initial);
    }

    if (event is RegisterProfile) {
      yield state.copyWth(
        status: RegisterStatus.loading,
      );

      ///check condition request state register profile and retry document
      if (state.stepRegister == StepRegister.uploadDoc) {
        add(UploadDocument());
      } else {
        var regisModel = state.registerData;
        var profile = regisModel.profile;
        // API is Required but ui dont have input fill
        profile = profile.copyWith(
          weight: 10,
          height: 10,
        );
        regisModel = regisModel.copyWith(profile: profile);

        var submit = await _registerRepository.registerProfile(regisModel);
        yield* submit.fold((Failure error) async* {
          yield state.copyWth(
              status: RegisterStatus.fail,
              stepRegister: StepRegister.registerProfile);
        }, (int res) async* {
          add(UploadDocument());
        });
      }
    }

    if (event is UploadDocument) {
      var docMol = state.documentModel;
      var userName = state.registerData.username;
      List<bool> resStatus = state.resStatusUploadDoc;
      List<Future<Either<Failure, String>>> requestList = [];
      // add event document unupload
      resStatus.asMap().forEach((index, res) {
        if (!res) {
          requestList.add(_registerRepository.uploadVolunteerDocument(
              path: getImgPath(docMol, index),
              type: DocumentType.values[index].name,
              userName: userName));
        } else {
          requestList.add(_registerRepository.uploadVolunteerDocument(
            path: '',
          ));
        }
      });

      /// request paralle request
      var response = await Future.wait(requestList);
      List<bool> newRes = [];
      response.asMap().forEach((index, element) {
        element.fold((err) {
          newRes.add(false);
        }, (res) {
          newRes.add(true);
        });
      });

      /// check all doc success
      if (newRes.any((res) => res == false)) {
        yield state.copyWth(
            status: RegisterStatus.fail,
            stepRegister: StepRegister.uploadDoc,
            resStatusUploadDoc: newRes);
      } else {
        yield state.copyWth(
            status: RegisterStatus.success,
            stepRegister: StepRegister.uploadDoc,
            resStatusUploadDoc: newRes);
      }
    }
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

bool checkMandatory(AddressDetailModel currentChange) {
  bool check = true;
  if (currentChange.addressNo.isEmpty ||
      currentChange.province.isEmpty ||
      currentChange.district.isEmpty ||
      currentChange.subDistrict.isEmpty ||
      currentChange.postalCode.isEmpty) {
    check = false;
  }

  return check;
}

Future pickPictureMethod(BuildContext context,
    {required FormFieldType type}) async {
  PickerFile _pickFile = PickerFile();
  ImageSource? source = await showImageSource(context);
  if (source != null) {
    XFile? file = await _pickFile.pickImageAndCrop(context, source: source);
    double fileSized = await _pickFile.getFileSizeMB(file!.path);
    context
        .read<VolunteerRegisterBloc>()
        .add(UpdateValue(type: type, value: file.path, otherVal: fileSized));
  }
}

Future delPictureMethod(BuildContext context,
    {required FormFieldType type}) async {
  context
      .read<VolunteerRegisterBloc>()
      .add(UpdateValue(type: type, value: '', otherVal: 0.0));
}

String getImgPath(DocumentModel docMol, int index) {
  switch (index) {
    case 0:
      return docMol.IDCard.imgPath;
    case 1:
      return docMol.IDCardCouple.imgPath;
    case 2:
      return docMol.volunteerCard.imgPath;
    case 3:
      return docMol.volunteerCardCouple.imgPath;
    default:
      return '';
  }
}

bool checkMandatoryPersonalProfile(ProfileRegisterModel profile) {
  return profile.name.isNotEmpty &&
      profile.citizenId.isNotEmpty &&
      profile.citizenId.length == 13 &&
      profile.birthDate.isNotEmpty &&
      profile.gender.isNotEmpty;
}

bool checkMandatoryDocument(DocumentModel picture) {
  return picture.IDCard.imgPath.isNotEmpty &&
      picture.IDCardCouple.imgPath.isNotEmpty &&
      picture.volunteerCard.imgPath.isNotEmpty &&
      picture.volunteerCardCouple.imgPath.isNotEmpty;
}
