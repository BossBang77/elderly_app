import 'package:json_annotation/json_annotation.dart';

part 'avaliable_time_detail.g.dart';

@JsonSerializable()
class AvaliableTimeDetail {
  const AvaliableTimeDetail(
      {this.code = '', this.isAvailable = false, this.name = ''});

  final String code;
  final String name;
  final bool isAvailable;

  //convert from json
  factory AvaliableTimeDetail.fromJson(Map<String, dynamic> json) =>
      _$AvaliableTimeDetailFromJson(json);

  List<Object?> get props => <Object>[code, name, isAvailable];
}
