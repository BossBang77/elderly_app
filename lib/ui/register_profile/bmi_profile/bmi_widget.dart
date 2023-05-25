import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/register_profile/bmi_profile/select_gender.dart';
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
          return Container();
        case BMIDetail.age:
          return Container();
        case BMIDetail.weightDetail:
          return Container();
        case BMIDetail.heightDetail:
          return Container();

        default:
          return Container();
      }
    }

    return Scaffold(
      backgroundColor: ColorTheme().white,
      appBar: appBar(onBack: () {}, title: 'โปรไฟล์ของฉัน'),
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
                    height: 40,
                  ),
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
                  btnName: 'ถัดไป',
                  onClick: () {},
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
