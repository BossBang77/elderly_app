import 'package:json_annotation/json_annotation.dart';

part 'sort_model.g.dart';

@JsonSerializable()
class SortModel {
  const SortModel({this.by = '', this.order = ''});

  ///convert from json
  factory SortModel.fromJson(Map<String, dynamic> json) =>
      _$SortModelFromJson(json);
  Map<String, dynamic> toJson() => _$SortModelToJson(this);
  final String by;
  final String order;

  SortModel copyWith({String? by, String? order}) =>
      SortModel(by: by ?? this.by, order: order ?? this.order);

  List<Object?> get props => <Object>[order, by];
}
