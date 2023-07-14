import 'package:health_application/ui/elderly/search_volunteer/model/rating_count_model.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/reviewer_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_res_model.g.dart';

@JsonSerializable()
class RatingResModel {
  const RatingResModel(
      {this.totals = 0,
      this.rating = 0,
      this.ratingCount = const <RatingCountModel>[],
      this.reviewers = const <ReviewerModel>[]});

  final int totals;
  final double rating;

  @JsonKey(
    name: 'reviews',
  )
  final List<ReviewerModel> reviewers;
  final List<RatingCountModel> ratingCount;

  //convert from json
  factory RatingResModel.fromJson(Map<String, dynamic> json) =>
      _$RatingResModelFromJson(json);

  List<Object?> get props => <Object>[totals, rating, ratingCount, reviewers];
}
