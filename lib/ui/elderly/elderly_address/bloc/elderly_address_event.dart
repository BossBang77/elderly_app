part of 'elderly_address_bloc.dart';

class ElderlyAddressEvent extends Equatable {
  ElderlyAddressEvent();

  @override
  List<Object> get props => [];
}

class LocationChange extends ElderlyAddressEvent {
  LocationChange({required this.location, this.type = ManageAddressType.edit});

  final LocationModel location;
  final ManageAddressType type;
  @override
  List<Object> get props => [location, type];
}

class onAcceptLocation extends ElderlyAddressEvent {
  final int index;
  final ManageAddressType type;

  onAcceptLocation({this.index = 0, required this.type});
}

class ManageAddress extends ElderlyAddressEvent {
  ManageAddress({required this.type});

  final ManageAddressType type;
}

class GetProfile extends ElderlyAddressEvent {
  GetProfile();
}

class ResetState extends ElderlyAddressEvent {
  ResetState();
}
