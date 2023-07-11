import 'package:health_application/ui/base/model/master_data_detail.dart';

extension MasterDataExtension on List<MasterDataDetail> {
  List<String> toListKeyName() {
    try {
      List<String> listKeyName = [];
      this.forEach((master) {
        listKeyName.add(master.keyName);
      });
      return listKeyName;
    } catch (e) {
      print(e);
      return [];
    }
  }

  String getKeyCode(String keyName) {
    try {
      return this
          .firstWhere((master) => master.keyName == keyName,
              orElse: () => MasterDataDetail())
          .keyCode;
    } catch (e) {
      print(e);
      return '';
    }
  }

  String getKeyName(String keyCode) {
    try {
      return this
          .firstWhere((master) => master.keyCode == keyCode,
              orElse: () => MasterDataDetail())
          .keyName;
    } catch (e) {
      print(e);
      return '';
    }
  }

  List<MasterDataDetail> filterByCategoryName(String categoryName) {
    List<MasterDataDetail> newList = [];
    try {
      this.forEach((element) {
        if (element.categoryName == categoryName) {
          newList.add(element);
        }
      });
      return newList.isNotEmpty ? newList : this;
    } catch (e) {
      return this;
    }
  }
}
