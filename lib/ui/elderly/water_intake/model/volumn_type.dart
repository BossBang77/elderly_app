import 'package:json_annotation/json_annotation.dart';

part 'volumn_type.g.dart';

@JsonSerializable()
class VolumnTypeModel {
  const VolumnTypeModel(
      {this.volumePic = '', this.volumeQuantity = 0, this.code = ''});

  final String volumePic;

  final int volumeQuantity;
  final String code;

  //convert from json
  factory VolumnTypeModel.fromJson(Map<String, dynamic> json) =>
      _$VolumnTypeModelFromJson(json);

  List<Object?> get props => <Object>[volumePic, volumeQuantity, code];
}
