import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../base/widget/app_bar_widget.dart';
import '../../ui-extensions/color.dart';
import 'bloc/health_profile_bloc.dart';

class BMISummaryWidget extends StatelessWidget {
  const BMISummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HealthProfileBloc, HealthProfileState>(
      builder: (context, state) {
        var profile = state.currentProfile.profile;
        var bmi = calculateBMI(profile.weight, profile.height);
        return Scaffold(
          backgroundColor: color.whiteBackground,
          appBar: appBar(
              onBack: () {
                addEvent(
                    context, ChangePageView(pageView: PageViewWidget.summary));
              },
              title: 'ดัชนีมวลกาย'),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Center(
                          child: textSubtitle24(
                              'ดัชนีมวลกายของคุณ', ColorTheme().black87)),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        checkBMI(bmi),
                        scale: 5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: textSubtitle24(
                              30.toStringAsFixed(1), ColorTheme().Primary)),
                      textSubtitle18Blod(
                          'น้ำหนัก ${getBMITitle(bmi)}', ColorTheme().black87),
                      const SizedBox(
                        height: 20,
                      ),
                      textSubtitle2(
                          'น้ำหนักที่มาตราฐานตามเกณฑ์ คือ\nระหว่าง 18.5 – 24.9 ',
                          ColorTheme().black87,
                          true),
                      const SizedBox(
                        height: 20,
                      ),
                      textSubtitle2(
                          'คำแนะนำ : \nควรกินอาหารให้ครบ 5 หมู่ \nในสัดส่วนที่เหมาะสม เเละออกกำลังกาย \nเพื่อสุขภาพที่ดี',
                          ColorTheme().black87,
                          true)
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ButtonGradient(
                    btnName: 'ยืนยัน',
                    onClick: () {
                      addEvent(context,
                          ChangePageView(pageView: PageViewWidget.summary));
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
