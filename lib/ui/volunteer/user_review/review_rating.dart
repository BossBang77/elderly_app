import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/slider_widget.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/rating_count_model.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/reviewer_model.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/volunteer/user_review/bloc/user_review_bloc.dart';

import '../../ui-extensions/color.dart';

class ReviewRatingWidget extends StatelessWidget {
  const ReviewRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserReviewBloc, UserReviewState>(
      builder: (context, state) {
        var review = state.reviews;
        var rateCount = [...review.ratingCount];
        var reviewer = review.reviewers;

        double getRatePercent(int currentRate) {
          double percent = 0;
          if (review.totals != 0) {
            RatingCountModel current = rateCount.firstWhere(
                (count) => count.rating == currentRate,
                orElse: () => const RatingCountModel());
            percent = (current.count / review.totals);
          }

          return percent;
        }

        int getTotal(int rate) {
          int total = 0;

          List<ReviewerModel> list = [];
          reviewer.forEach((reviewer) {
            if (reviewer.rating == rate) {
              total++;
            }
          });

          return total;
        }

        return Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  textButton1(review.rating.toString(), color.black87),
                  textButton2('${review.totals} เรตติ้ง', color.greyText)
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
                flex: 4,
                child: Column(
                  children: [
                    RateingBar(context,
                        barpercent: getRatePercent(5),
                        starValue: 5,
                        rateTotal: getTotal(5)),
                    RateingBar(context,
                        barpercent: getRatePercent(4),
                        starValue: 4,
                        rateTotal: getTotal(4)),
                    RateingBar(context,
                        barpercent: getRatePercent(3),
                        starValue: 3,
                        rateTotal: getTotal(3)),
                    RateingBar(context,
                        barpercent: getRatePercent(2),
                        starValue: 2,
                        rateTotal: getTotal(2)),
                    RateingBar(context,
                        barpercent: getRatePercent(1),
                        starValue: 1,
                        rateTotal: getTotal(1))
                  ],
                ))
          ],
        );
      },
    );
  }
}
