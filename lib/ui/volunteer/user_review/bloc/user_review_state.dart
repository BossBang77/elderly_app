part of 'user_review_bloc.dart';

class UserReviewState extends Equatable {
  const UserReviewState(
      {this.reviews = const RatingResModel(),
      this.isLoading = false,
      this.profileId = '',
      this.reviewSort = 0});

  @override
  List<Object> get props => [reviews, isLoading, profileId, reviewSort];

  final RatingResModel reviews;
  final String profileId;
  final bool isLoading;
  final int reviewSort;

  UserReviewState copyWith(
      {RatingResModel? registerMol,
      String? profileId,
      bool? isLoading,
      int? reviewSort}) {
    return UserReviewState(
        reviews: registerMol ?? this.reviews,
        profileId: profileId ?? this.profileId,
        isLoading: isLoading ?? this.isLoading,
        reviewSort: reviewSort ?? this.reviewSort);
  }
}

class UserReviewInitial extends UserReviewState {}
