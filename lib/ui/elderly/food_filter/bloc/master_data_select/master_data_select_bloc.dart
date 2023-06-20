import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/master_data_select/master_data_select_event.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/master_data_select/master_data_select_state.dart';
import 'package:health_application/ui/register_profile/model/sub_menu_model.dart';

class MasterDataSelectBloc extends Bloc<MasterDataSelectEvent, MasterDataSelectState> {
  MasterDataSelectBloc(): super(MasterDataSelectState()) {
    on<MasterDataSelectValueSelected>(_onMasterDataSelectValueSelected);
    on<MasterDataSelectValueRemoved>(_onMasterDataSelectValueRemoved);
    on<MasterDataSelectSearchValueChanged>(_onMasterDataSelectSearchValueChanged);
    on<MasterDataSelectValueRemovedAll>(_onMasterDataSelectValueRemovedAll);
    on<MasterDataSelectInitialValue>(_onMasterDataSelectInitialValue);
  }

  void _onMasterDataSelectValueSelected(
    MasterDataSelectValueSelected event,
    Emitter<MasterDataSelectState> emit
  ) {
    final List<SubMenuModel> newList = List.from(state.selectedItem);
    newList.add(event.value);
    emit(state.copyWith(selectedItem: newList));
    print(state.selectedItem);
  }

  void _onMasterDataSelectValueRemoved(
    MasterDataSelectValueRemoved event,
    Emitter<MasterDataSelectState> emit
  ) {
    final List<SubMenuModel> newList = List.from(state.selectedItem);
    newList.removeWhere((item) => event.value.code == item.code);
    emit(state.copyWith(selectedItem: newList));
  }

  void _onMasterDataSelectSearchValueChanged(
    MasterDataSelectSearchValueChanged event,
    Emitter<MasterDataSelectState> emit
  ) {
    emit(state.copyWith(searchText: event.value));
  }

  void _onMasterDataSelectValueRemovedAll(
    MasterDataSelectValueRemovedAll event,
    Emitter<MasterDataSelectState> emit
  ) {
    emit(state.copyWith(selectedItem: []));
  }

  void _onMasterDataSelectInitialValue(
    MasterDataSelectInitialValue event,
    Emitter<MasterDataSelectState> emit
  ) {
    emit(state.copyWith(selectedItem: event.value));
  }
}