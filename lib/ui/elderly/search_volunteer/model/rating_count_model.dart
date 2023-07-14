import 'package:json_annotation/json_annotation.dart';

part 'rating_count_model.g.dart';

@JsonSerializable()
class RatingCountModel {
  const RatingCountModel({this.rating = 0, this.count = 0});

  final int count;
  final num rating;

  //convert from json
  factory RatingCountModel.fromJson(Map<String, dynamic> json) =>
      _$RatingCountModelFromJson(json);

  List<Object?> get props => <Object>[rating, count];
}
