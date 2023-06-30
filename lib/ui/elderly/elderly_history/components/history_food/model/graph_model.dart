import 'package:json_annotation/json_annotation.dart';

part 'graph_model.g.dart';

@JsonSerializable()
class GraphModel {
  const GraphModel({this.date = '', this.value = 0, this.amount = 0});

  ///convert from json
  factory GraphModel.fromJson(Map<String, dynamic> json) =>
      _$GraphModelFromJson(json);

  final String date;
  final double value;
  final double amount;
}
