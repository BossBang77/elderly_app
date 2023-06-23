part of 'elderly_address_bloc.dart';

class ElderlyAddressEvent extends Equatable {
  ElderlyAddressEvent();

  @override
  List<Object> get props => [];
}

class LocationChange extends ElderlyAddressEvent {
  LocationChange({required this.location});

  final LocationModel location;
}

class onAcceptLocation extends ElderlyAddressEvent {
  onAcceptLocation();
}

class ManageAddress extends ElderlyAddressEvent {
  ManageAddress({required this.type});

  final ManageAddressType type;
}
