part of 'user_review_bloc.dart';

abstract class UserReviewEvent extends Equatable {
  const UserReviewEvent();

  @override
  List<Object> get props => [];
}

class GetReview extends UserReviewEvent {
  const GetReview();
}

class ReviewSort extends UserReviewEvent {
  final int sort;
  const ReviewSort({this.sort = 0});
  @override
  List<Object> get props => [sort];
}
