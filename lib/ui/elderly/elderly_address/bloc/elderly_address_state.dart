part of 'elderly_address_bloc.dart';

class ElderlyAddressState extends Equatable {
  const ElderlyAddressState({
    this.location = const LocationModel(),
    this.manageType = ManageAddressType.initial,
  });

  final LocationModel location;
  final ManageAddressType manageType;

  ElderlyAddressState copyWith({
    LocationModel? location,
    ManageAddressType? manageType,
  }) {
    return ElderlyAddressState(
      location: location ?? this.location,
      manageType: manageType ?? this.manageType,
    );
  }

  @override
  List<Object> get props => [location, manageType];
}

class ElderlyAddressInitial extends ElderlyAddressState {}

enum ManageAddressType {
  add,
  edit,
  initial,
}
