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
          return SelectDateOfBirth(
            dateOfBirth: state.registerModel.profile.birthDate,
          );
        case BMIDetail.weightDetail:
          return SelectWeigthWidget(context, state);
        case BMIDetail.heightDetail:
          return SelectHeightWidget(context, state);

        default:
          return SummaryBMIWidget(context, state);
      }
    }

    bool getMadatory(BuildContext context, RegisterProfileState state) {
      var profile = state.registerModel.profile;
      switch (state.bmiDetail) {
        case BMIDetail.gender:
          return state.gender != Gender.initial;
        case BMIDetail.name:
          return profile.name.isNotEmpty;
        case BMIDetail.age:
          return profile.age != 0;
        case BMIDetail.weightDetail:
          return profile.weight != 0;
        case BMIDetail.heightDetail:
          return profile.height != 0;
        default:
          return false;
      }
    }

    return Scaffold(
      backgroundColor: ColorTheme().white,
      appBar: appBar(
          onBack: () {
            if (state.bmiDetail == BMIDetail.gender) {
              context.read<RegisterProfileBloc>().add(
                  ChangeProfileView(profileType: ProfileType.privacyProfile));
            } else {
              context.read<RegisterProfileBloc>().add(BackwardBMIDetail());
            }
          },
          title: 'โปรไฟล์ของฉัน'),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: state.bmiDetail != BMIDetail.age
                  ? MediaQuery.of(context).size.height * 0.75
                  : MediaQuery.of(context).size.height,
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
                    padding: state.bmiDetail != BMIDetail.age
                        ? EdgeInsets.fromLTRB(15, 0, 15, 0)
                        : EdgeInsets.zero,
                    child: getView(context, state),
                  ),
                ],
              ),
            ),
            if (state.bmiDetail != BMIDetail.age)
              Column(
                children: [
                  ButtonGradient(
                    btnName: state.bmiDetail == BMIDetail.heightDetail
                        ? 'คำนวณหาดัชนีมวลกาย'
                        : 'ถัดไป',
                    onClick: () {
                      if (state.bmiDetail == BMIDetail.heightDetail) {
                        // คำนวณหาดัชนีมวลกาย
                        context.read<RegisterProfileBloc>().add(CalculateBMI());
                      }

                      if (state.bmiDetail == BMIDetail.summaryBMI) {
                        context.read<RegisterProfileBloc>().add(
                            ChangeProfileView(
                                profileType: ProfileType.disease));
                      } else {
                        if (getMadatory(context, state)) {
                          context
                              .read<RegisterProfileBloc>()
                              .add(ForwardBMIDetail());
                        }
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
