import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/linear_percent_indicator/linear_percent_indicator.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/image_notfound.dart';
import 'package:health_application/ui/base/widget/page_scroll.dart';
import 'package:health_application/ui/base/widget/slider_widget.dart';
import 'package:health_application/ui/base/widget/star_rateing.dart';
import 'package:health_application/ui/elderly/search_volunteer/bloc/search_volunteer_bloc.dart';
import 'package:health_application/ui/elderly/search_volunteer/component/volunteer_information.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/reviewer_model.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../base/constant/gender_const.dart';
import '../model/rating_count_model.dart';

class VolunteerDetailWidget extends StatelessWidget {
  const VolunteerDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    return BlocBuilder<SearchVolunteerBloc, SearchVolunteerState>(
      builder: (context, state) {
        var volunteer = state.currentVolunteerDetail;
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

        return Scaffold(
          body: PageScroll(
            leading: InkWell(
              onTap: () {
                context
                    .read<SearchVolunteerBloc>()
                    .add(Changeview(view: SearchVolunteerView.searchResult));
              },
              child: CircleAvatar(
                backgroundColor: color.whiteBackground.withOpacity(0.5),
                child: Image.asset(
                  'assets/images/back_arrow.png',
                  scale: 4,
                ),
              ),
            ),
            isNetWork: true,
            imgPath: volunteer.image,
            child: Container(
              color: ColorTheme().BlueFade2.withOpacity(0.1),
              child: Container(
                width: sized.width,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: color.whiteBackground,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      textSubtitle18Blod(volunteer.name, ColorTheme().black87),
                      const SizedBox(
                        height: 5,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/icon_star_point.png',
                              scale: 4,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            textButton2(
                                volunteer.rating.toString(), color.greyText),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: color.GreyBorder),
                                    color: color.grey10,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Gender.isWoman(volunteer.gender)
                                          ? 'assets/images/woman_volunteer_black.png'
                                          : 'assets/images/man_volunteer_black.png',
                                      scale: 4,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    textCaption1(
                                        '${Gender.isWoman(volunteer.gender) ? 'ผู้หญิง' : 'ผู้ชาย'}(${volunteer.age})',
                                        color.black87),
                                    textCaption2('เพศ/อายุ', Colors.grey),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: color.GreyBorder),
                                    color: color.grey10,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Gender.isWoman(volunteer.gender)
                                          ? 'assets/images/woman_volunteer_black.png'
                                          : 'assets/images/man_volunteer_black.png',
                                      scale: 4,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    textCaption1('${volunteer.experience} ปี',
                                        color.black87),
                                    textCaption2('ประสบการณ์', Colors.grey),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: color.GreyBorder),
                                    color: color.grey10,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Gender.isWoman(volunteer.gender)
                                          ? 'assets/images/woman_volunteer_black.png'
                                          : 'assets/images/man_volunteer_black.png',
                                      scale: 4,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    textCaption1(
                                        '${volunteer.totalAppointmentComplated} ครั้ง',
                                        color.black87),
                                    textCaption2('สำเร็จ', Colors.grey),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      textButton1('เกี่ยวกับจิตอาสา', color.black87),
                      const SizedBox(
                        height: 10,
                      ),
                      textH7(volunteer.description.isNoData(), color.black87),
                      const SizedBox(
                        height: 20,
                      ),
                      VolunteerInformation(context,
                          imgPath: 'assets/images/volunteer_code_icon.png',
                          subTitle: volunteer.volunteerCode.isNoData(),
                          title: 'รหัสจิตอาสา'),
                      VolunteerInformation(context,
                          imgPath: 'assets/images/elder_code_icon.png',
                          subTitle: volunteer.elderlyCareName.isNoData(),
                          title: 'เครือข่ายดูแลผู้สูงอายุ'),
                      // TODO unknow detail and intial of data
                      // VolunteerInformation(context,
                      //     imgPath: 'assets/images/availability_icon.png',
                      //     subTitle:
                      //         'วันจันทร์-วันอาทิตย์\n08:00 น. -20:00 น.',
                      //     title: 'Availability'),
                      VolunteerInformation(context,
                          imgPath: 'assets/images/contact_icon.png',
                          subTitle:
                              '${volunteer.address.getfullAddress().isNoData()} \n\n${volunteer.elderlyCareContactMobile.toPhoneFormat().isNoData()}',
                          title: 'ช่องทางติดต่อ'),
                      const SizedBox(
                        height: 20,
                      ),
                      textButton1('รีวิวจากผู้ใช้งาน', color.black87),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                textButton1(
                                    review.rating.toString(), color.black87),
                                textButton2(
                                    '${review.totals.toString()} เรตติ้ง',
                                    color.greyText)
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
                                      starValue: 5),
                                  RateingBar(context,
                                      barpercent: getRatePercent(4),
                                      starValue: 4),
                                  RateingBar(context,
                                      barpercent: getRatePercent(3),
                                      starValue: 3),
                                  RateingBar(context,
                                      barpercent: getRatePercent(2),
                                      starValue: 2),
                                  RateingBar(context,
                                      barpercent: getRatePercent(1),
                                      starValue: 1)
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          for (int i = 4; i >= 0; i--)
                            Flexible(
                                child: InkWell(
                              onTap: () {
                                if ((i + 1) == state.reviewSort) {
                                  context
                                      .read<SearchVolunteerBloc>()
                                      .add(ReviewSort(sort: 0));
                                } else {
                                  context
                                      .read<SearchVolunteerBloc>()
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
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
                            Center(
                                child: textCaption2(
                                    'ไม่พบข้อมูล', color.greyText)),
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
                                textButton1(reviewerList[i].name.isNoData(),
                                    color.black87),
                                textButton2(
                                    ' ${reviewerList[i].created.parseTime().toDisplayFullBuddishDate(locale: 'th')}',
                                    color.greyText),
                              ],
                            ),
                            StarRate(context, 1),
                            textButton2(reviewerList[i].description.isNoData(),
                                color.greyText),
                            Divider(),
                          ],
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonGradient(
                        btnName: 'นัดหมาย',
                        onClick: () async {
                          await context
                              .read<SearchVolunteerBloc>()
                              .initialState();
                          context.read<SearchVolunteerBloc>().add(Changeview(
                              view: SearchVolunteerView.AppointVolunteer));
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
