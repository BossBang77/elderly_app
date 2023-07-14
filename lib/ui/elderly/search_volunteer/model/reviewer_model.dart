import 'package:json_annotation/json_annotation.dart';

part 'reviewer_model.g.dart';

@JsonSerializable()
class ReviewerModel {
  const ReviewerModel(
      {this.appointmentId = '',
      this.created = '',
      this.name = '',
      this.description = '',
      this.rating = 0});

  final String appointmentId;
  final String created;
  final String name;
  final String description;
  final num rating;

  //convert from json
  factory ReviewerModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewerModelFromJson(json);

  List<Object?> get props =>
      <Object>[appointmentId, created, name, description, rating];
}
