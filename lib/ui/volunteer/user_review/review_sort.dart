import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/star_rateing.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/reviewer_model.dart';
import 'package:health_application/ui/extension/date_extension.dart';
import 'package:health_application/ui/extension/string_extension.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/volunteer/user_review/bloc/user_review_bloc.dart';

import '../../ui-extensions/color.dart';

class ReviewSortWidget extends StatelessWidget {
  const ReviewSortWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserReviewBloc, UserReviewState>(
      builder: (context, state) {
        var review = state.reviews;

        var reviewer = review.reviewers;
        List<ReviewerModel> getReviewList() {
          if (state.reviewSort == 0) {
            return reviewer;
          }
          List<ReviewerModel> list = [];
          reviewer.forEach((reviewer) {
            if (reviewer.rating == state.reviewSort) {
              list.add(reviewer);
            }
          });

          return list;
        }

        var reviewerList = getReviewList();
        return Column(
          children: [
            Row(
              children: [
                for (int i = 4; i >= 0; i--)
                  Flexible(
                      child: InkWell(
                    onTap: () {
                      if ((i + 1) == state.reviewSort) {
                        context.read<UserReviewBloc>().add(ReviewSort(sort: 0));
                      } else {
                        context
                            .read<UserReviewBloc>()
                            .add(ReviewSort(sort: i + 1));
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: (i + 1) == state.reviewSort
                                ? color.DartBlue
                                : color.GreyBorder),
                        color: (i + 1) == state.reviewSort
                            ? color.DartBlue
                            : color.grey10,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          textH7(
                            (i + 1).toString(),
                            (i + 1) == state.reviewSort
                                ? color.white
                                : color.black87,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            (i + 1) == state.reviewSort
                                ? 'assets/images/star_white.png'
                                : 'assets/images/star_outline.png',
                            scale: 3,
                            color: (i + 1) == state.reviewSort
                                ? color.white
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(),
            if (reviewerList.isEmpty) ...{
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(child: textCaption2('ไม่พบข้อมูล', color.greyText)),
                ],
              )
            },
            const SizedBox(
              height: 20,
            ),
            for (int i = 0; i < reviewerList.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textButton1(
                          reviewerList[i].name.isNoData(), color.black87),
                      textButton2(
                          ' ${reviewerList[i].created.parseTime().toDisplayThailandDate()}',
                          color.greyText),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  StarRate(context, reviewerList[i].rating),
                  if (reviewerList[i].description.isNotEmpty)
                    Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        textButton2(
                            reviewerList[i].description, color.greyText),
                      ],
                    ),
                  const SizedBox(
                    height: 3,
                  ),
                  Divider()
                ],
              ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
