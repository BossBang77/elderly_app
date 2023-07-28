part of 'volunteer_register_bloc.dart';

enum RegisterStatus { initial, loading, success, fail }

enum FormFieldType {
  name,
  cid,
  birthDate,
  sex,
  addressNo,
  roomNo,
  floor,
  moo,
  soi,
  buildingName,
  road,
  postalCode,
  province,
  district,
  subdistrict,
  addAddress,
  experience,
  uploadCID,
  uploadCIDCouple,
  uploadVolunteerCard,
  uploadVolunteerCardCouple
}

enum SexType {
  MALE,
  FEMALE,
}

class VolunteerRegisterState extends Equatable {
  const VolunteerRegisterState(
      {this.status = RegisterStatus.initial,
      this.name = '',
      this.cid = '',
      this.birthDate = '',
      this.sex = '',
      this.registerData = const RegisterModel(),
      this.documentModel = const DocumentModel(),
      this.stepRegister = StepRegister.registerProfile,
      this.resStatusUploadDoc = const [false, false, false, false]});

  ///initial
  const VolunteerRegisterState.initial() : this();

  final RegisterStatus status;
  final String name;
  final String cid;
  final String birthDate;
  final String sex;
  final RegisterModel registerData;

  final DocumentModel documentModel;
  final StepRegister stepRegister;

  final List<bool> resStatusUploadDoc;

  VolunteerRegisterState copyWth(
      {RegisterStatus? status,
      String? name,
      String? cid,
      String? birthDate,
      String? sex,
      RegisterModel? registerData,
      String? personalCardPick,
      DocumentModel? documentModel,
      StepRegister? stepRegister,
      List<bool>? resStatusUploadDoc}) {
    return VolunteerRegisterState(
        status: status ?? this.status,
        name: name ?? this.name,
        cid: cid ?? this.cid,
        birthDate: birthDate ?? this.birthDate,
        sex: sex ?? this.sex,
        registerData: registerData ?? this.registerData,
        documentModel: documentModel ?? this.documentModel,
        stepRegister: stepRegister ?? this.stepRegister,
        resStatusUploadDoc: resStatusUploadDoc ?? this.resStatusUploadDoc);
  }

  @override
  List<Object> get props => [
        status,
        name,
        cid,
        birthDate,
        sex,
        registerData,
        documentModel,
        stepRegister,
        resStatusUploadDoc
      ];
}

enum AddressType {
  CONTACT_ADDRESS(title: 'ที่อยู่ที่ติดต่อได้'),
  REGISTER_ADDRESS(title: 'ที่อยู่ตามทะเบียนบ้าน');

  final String title;
  const AddressType({required this.title});
}

enum DocumentType {
  CITIZEN_CARD,
  PERSONAL_PAIR_CITIZEN_CARD,
  VOLUNTEER_CARD,
  PERSONAL_PAIR_VOLUNTEER_CARD,
}

enum StepRegister { registerProfile, uploadDoc }
