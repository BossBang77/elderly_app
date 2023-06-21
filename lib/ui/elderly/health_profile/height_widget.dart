import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../base/widget/text_field_line.dart';
import '../../ui-extensions/color.dart';
import 'bloc/health_profile_bloc.dart';

class HeightWidget extends StatelessWidget {
  const HeightWidget({super.key});

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
                          type: FillType.heightDetail,
                          value: state.masterProfile.profile.height));
                  addEvent(context,
                      ChangePageView(pageView: PageViewWidget.summary));
                },
                title: 'ส่วนสูง'),
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Center(
                          child: textSubtitle24(
                              'ส่วนสูงของฉัน', ColorTheme().black87)),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFieldLine(
                          controller: TextEditingController(
                              text: profile.height != 0
                                  ? profile.height.toString()
                                  : ''),
                          textNumberType: true,
                          maxLength: 3,
                          hintText: 'ส่วนสูงของฉัน',
                          onChange: ((value) {
                            context.read<HealthProfileBloc>().add(FormFillType(
                                  type: FillType.heightDetail,
                                  value: int.tryParse(value) ?? 0,
                                ));
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      textSubtitle16Blod(
                          'เซนติเมตร (ซม.)', ColorTheme().black87),
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
