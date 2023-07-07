part of 'elderly_address_bloc.dart';

class ElderlyAddressState extends Equatable {
  const ElderlyAddressState(
      {this.location = const LocationModel(),
      this.manageType = ManageAddressType.initial,
      this.isLoading = false,
      this.userProfile = const RegisterModel(),
      this.addressState = ChangeAddressState.initial});

  final LocationModel location;
  final ManageAddressType manageType;
  final bool isLoading;
  final RegisterModel userProfile;
  final ChangeAddressState addressState;
  ElderlyAddressState copyWith({
    LocationModel? location,
    ManageAddressType? manageType,
    bool? isLoading,
    RegisterModel? userProfile,
    ChangeAddressState? addressState,
  }) {
    return ElderlyAddressState(
        location: location ?? this.location,
        manageType: manageType ?? this.manageType,
        isLoading: isLoading ?? this.isLoading,
        userProfile: userProfile ?? this.userProfile,
        addressState: addressState ?? this.addressState);
  }

  @override
  List<Object> get props => [location, manageType, isLoading, userProfile];
}

class ElderlyAddressInitial extends ElderlyAddressState {}

enum ManageAddressType {
  add,
  edit,
  delete,
  initial,
}

enum ChangeAddressState { initial, changeAddressSuccess, changeAddressFail }
