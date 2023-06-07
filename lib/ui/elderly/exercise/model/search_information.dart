import 'package:json_annotation/json_annotation.dart';

part 'search_information.g.dart';

@JsonSerializable()
class SearchInformationModel {
  const SearchInformationModel(
      {this.name = '',
      this.burnCalorie = 0,
      this.code = '',
      this.description = '',
      this.image = '',
      this.time = 0,
      this.type = '',
      this.video = ''});

  ///convert from json
  factory SearchInformationModel.fromJson(Map<String, dynamic> json) =>
      _$SearchInformationModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchInformationModelToJson(this);
  final String name;
  final String code;
  final String description;
  final String type;
  final num time;
  final num burnCalorie;
  final String image;
  final String video;

  List<Object?> get props =>
      <Object>[name, code, description, type, time, burnCalorie, image, video];
}
