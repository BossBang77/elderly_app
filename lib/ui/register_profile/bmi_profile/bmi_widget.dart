import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/register_profile/bmi_profile/select_age.dart';
import 'package:health_application/ui/register_profile/bmi_profile/select_gender.dart';
import 'package:health_application/ui/register_profile/bmi_profile/select_height.dart';
import 'package:health_application/ui/register_profile/bmi_profile/select_name.dart';
import 'package:health_application/ui/register_profile/bmi_profile/select_weigth.dart';
import 'package:health_application/ui/register_profile/bmi_profile/summary_bmi.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

class BMIWidget extends StatelessWidget {
  const BMIWidget({super.key, required this.state});
  final RegisterProfileState state;
  @override
  Widget build(BuildContext context) {
    Widget getView(BuildContext context, RegisterProfileState state) {
      switch (state.bmiDetail) {
        case BMIDetail.gender:
          return SelectGenderWidget(context, state);
        case BMIDetail.name:
          return SelectNameWidget(context, state);
        case BMIDetail.age:
          return SelectAgeWidget(context, state);
        case BMIDetail.weightDetail:
          return SelectWeigthWidget(context, state);
        case BMIDetail.heightDetail:
          return SelectHeightWidget(context, state);

        default:
          return SummaryBMIWidget(context);
      }
    }

    return Scaffold(
      backgroundColor: ColorTheme().white,
      appBar: appBar(
          onBack: () {
            context.read<RegisterProfileBloc>().add(BackwardBMIDetail());
          },
          title: 'โปรไฟล์ของฉัน'),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  if (state.bmiDetail != BMIDetail.summaryBMI)
                    textSubtitle16Blod(
                        'Step ${state.bmiDetail.index + 1}/ ${BMIDetail.values.length}',
                        ColorTheme().grey50),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: getView(context, state),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ButtonGradient(
                  btnName: state.bmiDetail == BMIDetail.heightDetail
                      ? 'คำนวณหาดัชนีมวลกาย'
                      : 'ถัดไป',
                  onClick: () {
                    if (state.bmiDetail == BMIDetail.summaryBMI) {
                      context.read<RegisterProfileBloc>().add(
                          ChangeProfileView(profileType: ProfileType.disease));
                    } else {
                      context
                          .read<RegisterProfileBloc>()
                          .add(ForwardBMIDetail());
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
