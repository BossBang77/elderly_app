import 'package:health_application/ui/elderly/search_volunteer/model/rating_count_model.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/reviewer_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_res_model.g.dart';

@JsonSerializable()
class RatingResModel {
  const RatingResModel(
      {this.totals = 10,
      this.rating = 0,
      this.ratingCount = const [
        RatingCountModel(count: 1, rating: 4),
        RatingCountModel(count: 9, rating: 1)
      ],
      this.reviewers = const [
        ReviewerModel(created: '01-01-2023', rating: 4, description: 'good'),
        ReviewerModel(created: '01-01-2023', rating: 1, description: 'good1')
      ]});

  final int totals;
  final int rating;
  final List<ReviewerModel> reviewers;
  final List<RatingCountModel> ratingCount;

  //convert from json
  factory RatingResModel.fromJson(Map<String, dynamic> json) =>
      _$RatingResModelFromJson(json);

  List<Object?> get props => <Object>[totals, rating, ratingCount, reviewers];
}
