import 'package:equatable/equatable.dart';
import 'package:health_application/ui/base/model/master_data.dart';
import 'package:health_application/ui/base/model/master_data_detail.dart';
import 'package:health_application/ui/register_profile/model/sub_menu_model.dart';

class MasterDataSelectState extends Equatable {
  const MasterDataSelectState({
    this.selectedItem = const[],
    this.searchText = ''
  });

  // final List<MasterDataDetail> selectedItem;
  final List<SubMenuModel> selectedItem;
  final String searchText;

  @override
  List<Object?> get props => [selectedItem, searchText];

  MasterDataSelectState copyWith({
    List<SubMenuModel>? selectedItem,
    String? searchText
  }) {
    return MasterDataSelectState(
      selectedItem: selectedItem ?? this.selectedItem,
      searchText: searchText ?? this.searchText
    );
  }
}