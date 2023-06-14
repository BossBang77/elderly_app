import 'package:json_annotation/json_annotation.dart';

part 'code_model.g.dart';

@JsonSerializable()
class CodeModel {
  const CodeModel({this.code = ''});

  final String code;

  //convert from json
  factory CodeModel.fromJson(Map<String, dynamic> json) =>
      _$CodeModelFromJson(json);

  CodeModel copyWith({String? code}) => CodeModel(code: code ?? this.code);
  Map<String, dynamic> toJson() => _$CodeModelToJson(this);

  List<Object?> get props => <Object>[code];
}
