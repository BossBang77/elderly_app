import 'package:json_annotation/json_annotation.dart';

part 'sub_menu_model.g.dart';

@JsonSerializable()
class SubMenuModel {
  const SubMenuModel({this.code = '', this.name = ''});

  ///convert from json
  factory SubMenuModel.fromJson(Map<String, dynamic> json) =>
      _$SubMenuModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubMenuModelToJson(this);
  final String name;
  final String code;

  SubMenuModel copyWith({String? name, String? code}) {
    return SubMenuModel(code: code ?? this.code, name: name ?? this.name);
  }

  List<Object?> get props => <Object>[code, name];
}
