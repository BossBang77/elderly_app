part of 'elderly_address_bloc.dart';

class ElderlyAddressState extends Equatable {
  const ElderlyAddressState();

  ElderlyAddressState copyWith() {
    return ElderlyAddressState();
  }

  @override
  List<Object> get props => [];
}

class ElderlyAddressInitial extends ElderlyAddressState {}

enum ManageAddressType {
  add,
  edit,
}
