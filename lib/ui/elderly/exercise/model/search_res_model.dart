import 'package:json_annotation/json_annotation.dart';

part 'search_res_model.g.dart';

@JsonSerializable()
class SearchResModel {
  const SearchResModel(
      {this.burnCalorie = 0,
      this.code = '',
      this.image = '',
      this.name = '',
      this.time = 0});

  ///convert from json
  factory SearchResModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResModelToJson(this);
  final String name;
  final String code;
  final String image;
  final num time;
  final num burnCalorie;

  SearchResModel copyWith(
          {String? name,
          String? code,
          String? image,
          num? burnCalorie,
          num? time}) =>
      SearchResModel(
          name: name ?? this.name,
          code: code ?? this.code,
          image: image ?? this.image,
          burnCalorie: burnCalorie ?? this.burnCalorie,
          time: time ?? this.time);

  List<Object?> get props => <Object>[name, code, image, burnCalorie];
}
