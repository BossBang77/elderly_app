import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/model/master_data_detail.dart';
import 'package:health_application/ui/register_profile/model/sub_menu_model.dart';

abstract class MasterDataSelectEvent extends Equatable {
  const MasterDataSelectEvent();
}

class MasterDataSelectSearchValueChanged extends MasterDataSelectEvent {
  const MasterDataSelectSearchValueChanged({
    this.value = ''
  });

  final String value;

  @override
  List<Object?> get props => [value];
}

class MasterDataSelectValueSelected extends MasterDataSelectEvent {
  const MasterDataSelectValueSelected({
    required this.value
  });

  final SubMenuModel value;

  @override
  List<Object?> get props => [value];
}

class MasterDataSelectValueRemoved extends MasterDataSelectEvent {
  const MasterDataSelectValueRemoved({
    required this.value
  });

  final SubMenuModel value;

  @override
  List<Object?> get props => [value];
}

class MasterDataSelectValueRemovedAll extends MasterDataSelectEvent {
  @override
  List<Object?> get props => [];
}

class MasterDataSelectInitialValue extends MasterDataSelectEvent {
  const MasterDataSelectInitialValue({required this.value});

  final List<SubMenuModel> value;

  @override
  List<Object?> get props => [value];
}