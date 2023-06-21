import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/text_field_line.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../base/widget/button_gradient.dart';
import '../../ui-extensions/color.dart';
import 'bloc/health_profile_bloc.dart';

class WeightWidget extends StatelessWidget {
  const WeightWidget({super.key});

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
                          type: FillType.weightDetail,
                          value: state.masterProfile.profile.weight));
                  addEvent(context,
                      ChangePageView(pageView: PageViewWidget.summary));
                },
                title: 'น้ำหนัก'),
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Center(
                          child: textSubtitle24(
                              'น้ำหนักของฉัน', ColorTheme().black87)),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFieldLine(
                          controller: TextEditingController(
                              text: profile.weight != 0
                                  ? profile.weight.toString()
                                  : ''),
                          textNumberType: true,
                          maxLength: 4,
                          hintText: 'น้ำหนักของฉัน',
                          onChange: ((value) {
                            context.read<HealthProfileBloc>().add(FormFillType(
                                  type: FillType.weightDetail,
                                  value: int.tryParse(value) ?? 0,
                                ));
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      textSubtitle16Blod(
                          'กิโลกรัม (กก.)', ColorTheme().black87),
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
