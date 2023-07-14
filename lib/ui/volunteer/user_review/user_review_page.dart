import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/volunteer/user_review/bloc/user_review_bloc.dart';
import 'package:health_application/ui/volunteer/user_review/review_rating.dart';
import 'package:health_application/ui/volunteer/user_review/review_sort.dart';

import '../../base/routes.dart';

class UserReviewPage extends StatelessWidget {
  const UserReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserReviewBloc()..add(GetReview()),
      child: BlocConsumer<UserReviewBloc, UserReviewState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(
                onBack: () {
                  context.go(Routes.home);
                },
                title: 'รีวิวจากผู้ใช้งาน'),
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SpaceWidget(
                      height: 20,
                    ),
                    ReviewRatingWidget(),
                    SpaceWidget(
                      height: 20,
                    ),
                    Divider(),
                    SpaceWidget(
                      height: 20,
                    ),
                    ReviewSortWidget(),
                    SpaceWidget(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
