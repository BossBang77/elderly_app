part of 'volunteer_address_bloc.dart';

class VolunteerAddressState extends Equatable {
  const VolunteerAddressState(
      {this.section = VoluteerAddressSection.summaryAddress,
      this.isLoading = false,
      this.profile = const RegisterModel(),
      this.currentChange = const RegisterModel(),
      this.typeChange = AddressType.CONTACT_ADDRESS,
      this.submitStatus = SubmitStatus.initial,
      this.selectSameRegister = false});

  final VoluteerAddressSection section;
  final bool isLoading;
  final RegisterModel profile;
  final RegisterModel currentChange;
  final AddressType typeChange;
  final SubmitStatus submitStatus;
  final bool selectSameRegister;

  VolunteerAddressState copyWith(
      {VoluteerAddressSection? section,
      bool? isLoading,
      RegisterModel? profile,
      RegisterModel? currentChange,
      AddressType? typeChange,
      SubmitStatus? submitStatus,
      bool? selectSameRegister}) {
    return VolunteerAddressState(
        section: section ?? this.section,
        isLoading: isLoading ?? this.isLoading,
        profile: profile ?? this.profile,
        currentChange: currentChange ?? this.currentChange,
        typeChange: typeChange ?? this.typeChange,
        submitStatus: submitStatus ?? this.submitStatus,
        selectSameRegister: selectSameRegister ?? this.selectSameRegister);
  }

  const VolunteerAddressState.initial(
      {this.section = VoluteerAddressSection.summaryAddress,
      this.isLoading = false,
      this.profile = const RegisterModel(),
      this.currentChange = const RegisterModel(),
      this.typeChange = AddressType.CONTACT_ADDRESS,
      this.submitStatus = SubmitStatus.initial,
      this.selectSameRegister = false});

  @override
  List<Object> get props => [
        section,
        isLoading,
        profile,
        currentChange,
        typeChange,
        submitStatus,
        selectSameRegister
      ];
}

class VolunteerAddressInitial extends VolunteerAddressState {}

enum VoluteerAddressSection { summaryAddress, fillVolunteerAddress }

enum AddressType {
  CONTACT_ADDRESS(title: 'ที่อยู่ที่ติดต่อได้'),
  REGISTER_ADDRESS(title: 'ที่อยู่ตามทะเบียนบ้าน');

  final String title;
  const AddressType({required this.title});
}

enum TypeAddress {
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
  selectSameRegister
}

enum SubmitStatus { success, fail, initial }
