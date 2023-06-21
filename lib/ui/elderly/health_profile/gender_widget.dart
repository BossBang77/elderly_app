import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/elderly/health_profile/bloc/health_profile_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../base/constant/gender_const.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HealthProfileBloc, HealthProfileState>(
      builder: (context, state) {
        var profile = state.currentProfile.profile;
        return Scaffold(
            backgroundColor: color.whiteBackground,
            appBar: appBar(
                onBack: () {
                  addEvent(
                      context,
                      FormFillType(
                        type: FillType.gender,
                        value: state.masterProfile.profile.gender,
                      ));
                  addEvent(context,
                      ChangePageView(pageView: PageViewWidget.summary));
                },
                title: 'เพศ'),
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                          child: textSubtitle24(
                              'ฉันเป็น...', ColorTheme().black87)),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  context
                                      .read<HealthProfileBloc>()
                                      .add(FormFillType(
                                        type: FillType.gender,
                                        value: Gender.maleCode,
                                      ));
                                },
                                child: Image.asset(
                                  profile.gender == Gender.maleCode
                                      ? 'assets/images/man_active.png'
                                      : 'assets/images/man_inactive.png',
                                  scale: 4,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              textSubtitle16Blod(
                                  'ผู้ชาย', ColorTheme().black87),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  context
                                      .read<HealthProfileBloc>()
                                      .add(FormFillType(
                                        type: FillType.gender,
                                        value: Gender.femaleCode,
                                      ));
                                },
                                child: Image.asset(
                                  profile.gender == Gender.femaleCode
                                      ? 'assets/images/woman_active.png'
                                      : 'assets/images/woman_inactive.png',
                                  scale: 4,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              textSubtitle16Blod(
                                  'ผู้หญิง', ColorTheme().black87),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ButtonGradient(
                        btnName: 'ยืนยัน',
                        onClick: () {
                          addEvent(context, SubmitEdit());
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
