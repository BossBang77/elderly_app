import 'package:json_annotation/json_annotation.dart';

part 'appoint_code.g.dart';

@JsonSerializable()
class AppointCode {
  const AppointCode({this.code = '', this.name = ''});

  final String code;
  final String name;

  //convert from json
  factory AppointCode.fromJson(Map<String, dynamic> json) =>
      _$AppointCodeFromJson(json);

  Map<String, dynamic> toJson() => _$AppointCodeToJson(this);

  List<Object?> get props => <Object>[code, name];
}
