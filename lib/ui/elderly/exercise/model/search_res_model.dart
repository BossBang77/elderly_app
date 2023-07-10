import 'package:json_annotation/json_annotation.dart';

part 'search_res_model.g.dart';

@JsonSerializable()
class SearchResModel {
  const SearchResModel(
      {this.burnCaloriePoint = 0,
      this.code = '',
      this.image = '',
      this.name = '',
      this.timePoint = 0,
      this.id = '',
      this.burnCalorie = 0,
      this.time = 0});

  ///convert from json
  factory SearchResModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResModelToJson(this);
  final String id;
  final String name;
  final String code;
  final String image;
  final double timePoint;
  final double burnCaloriePoint;
  final double time;
  final double burnCalorie;

  SearchResModel copyWith(
          {String? name,
          String? code,
          String? image,
          double? burnCaloriePoint,
          double? timePoint,
          double? burnCalorie,
          double? time,
          String? id}) =>
      SearchResModel(
          name: name ?? this.name,
          code: code ?? this.code,
          image: image ?? this.image,
          burnCaloriePoint: burnCaloriePoint ?? this.burnCaloriePoint,
          timePoint: timePoint ?? this.timePoint,
          id: id ?? this.id);

  List<Object?> get props => <Object>[
        name,
        code,
        image,
        burnCaloriePoint,
        timePoint,
        time,
        burnCalorie
      ];
}
