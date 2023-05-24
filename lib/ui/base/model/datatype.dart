import 'package:equatable/equatable.dart';

///User Address
class DataType extends Equatable {
  ///constructor
  const DataType({
    this.name = '',
    this.code = '',
  });

  ///no
  final String name;

  ///moo
  final String code;

  DataType copyWith({String? name, String? code}) =>
      DataType(name: name ?? this.name, code: code ?? this.code);

  ///get empty
  static const DataType empty = DataType();

  @override
  List<Object> get props => <Object>[name, code];
}

extension MasterListDataType on List<DataType> {
  String getCode(String name) => getCodeFromName(this, name);
  String getCodeFromName(List<DataType> data, String name) {
    String code = '';
    var item = data.firstWhere((DataType item) => item.name == name,
        orElse: () => DataType());
    code = item.code;
    return code;
  }

  List<String> getListName() {
    List<String> nameList = [];
    forEach((master) {
      nameList.add(master.name);
    });
    return nameList;
  }
}
