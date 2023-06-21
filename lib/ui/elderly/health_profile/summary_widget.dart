import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/constant/gender_const.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/elderly/health_profile/bloc/health_profile_bloc.dart';
import 'package:health_application/ui/elderly/health_profile/component/health_menu.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HealthProfileBloc, HealthProfileState>(
      builder: (context, state) {
        var profile = state.currentProfile.profile;
        var bmi = calculateBMI(profile.weight, profile.height);
        return Scaffold(
            backgroundColor: color.white,
            appBar: appBar(
                onBack: () {
                  Navigator.pop(context);
                },
                title: 'ข้อมูลสุขภาพ'),
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    HealthMenu(
                      title: 'เพศ',
                      subtitle: Gender.mapToTitle(profile.gender),
                      callback: () {
                        addEvent(context,
                            ChangePageView(pageView: PageViewWidget.gender));
                      },
                    ),
                    HealthMenu(
                      title: 'ส่วนสูง',
                      subtitle: '${profile.height} ซม.',
                      callback: () {
                        addEvent(context,
                            ChangePageView(pageView: PageViewWidget.height));
                      },
                    ),
                    HealthMenu(
                      title: 'น้ำหนัก',
                      subtitle: '${profile.weight}  กก.',
                      callback: () {
                        addEvent(context,
                            ChangePageView(pageView: PageViewWidget.weight));
                      },
                    ),
                    HealthMenu(
                      title: 'วัน/เดือน/ปีเกิด',
                      subtitle: profile.birthDate.isEmpty
                          ? 'ยังไม่ระบุ'
                          : profile.birthDate
                              .parseTime()
                              .toDisplayBuddhistDate(),
                      nullData: false,
                      callback: () {
                        addEvent(
                            context,
                            ChangePageView(
                                pageView: PageViewWidget.dateOfBirth));
                      },
                    ),
                    HealthMenu(
                      title: 'อายุ',
                      subtitle: '${profile.age} ปี',
                      callback: () {},
                      isEdit: false,
                    ),
                    HealthMenu(
                      title: 'ดัชนีมวลกาย',
                      subtitle: getBMITitle(bmi),
                      callback: () {
                        addEvent(context,
                            ChangePageView(pageView: PageViewWidget.bmi));
                      },
                    ),
                    HealthMenu(
                      title: 'โรคประจำตัว',
                      subtitle: '',
                      callback: () {
                        addEvent(context,
                            ChangePageView(pageView: PageViewWidget.disease));
                      },
                    ),
                    HealthMenu(
                      title: 'การแพ้อาหาร',
                      subtitle: '',
                      callback: () {
                        addEvent(
                            context,
                            ChangePageView(
                                pageView: PageViewWidget.foodAllergies));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonGradient(
                      btnName: 'บันทึกข้อมูล',
                      onClick: () {
                        addEvent(context, SubmitEditProfile());
                      },
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
