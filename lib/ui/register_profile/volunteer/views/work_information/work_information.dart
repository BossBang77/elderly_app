import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/register_profile/volunteer/bloc/volunteer_register_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../bloc/register_profile_bloc.dart';

class WorkInformationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VolunteerRegisterBloc, VolunteerRegisterState>(
      builder: (context, state) {
        return Scaffold(
            appBar: appBar(onBack: () {
              context
                  .read<RegisterProfileBloc>()
                  .add(ChangeProfileView(profileType: ProfileType.address));
            }),
            backgroundColor: ColorTheme().white,
            body: SingleChildScrollView(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textSubtitle18Blod('ข้อมูลการทำงาน', ColorTheme().black87),
                    const SizedBox(
                      height: 20,
                    ),
                    textSubtitle18Blod('รหัสจิตอาสา', ColorTheme().black87),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget.disable(
                        text: state.registerData.volunteerCode,
                        hintText: 'รหัสจิตอาสา'),
                    const SizedBox(
                      height: 20,
                    ),
                    textSubtitle18Blod(
                        'รหัสเครือข่ายดูแลผู้สูงอายุ', ColorTheme().black87),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget.disable(
                      text: state.registerData.elderlyCareCode,
                      hintText: 'รหัสเครือข่ายดูแลผู้สูงอายุ',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textSubtitle18Blod(
                        'ชื่อเครือข่ายดูแลผู้สูงอายุ', ColorTheme().black87),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget.disable(
                      text: '-',
                      hintText: 'ชื่อเครือข่ายดูแลผู้สูงอายุ',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textSubtitle18Blod(
                        'ที่อยู่เครือข่ายดูแลผู้สูงอายุ', ColorTheme().black87),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget.disable(
                      text: '-',
                      hintText: 'ที่อยู่',
                      minLines: 3,
                      multiLine: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textSubtitle18Blod('ประสบการณ์', ColorTheme().black87),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget.enable(
                      text: state.registerData.profile.experience == 0
                          ? ''
                          : state.registerData.profile.experience.toString(),
                      hintText: 'ประสบการณ์',
                      textNumberType: true,
                      maxLength: 2,
                      suffix: true,
                      suffixTxt: 'ปี',
                      onChanged: (value) {
                        context.read<VolunteerRegisterBloc>().add(UpdateValue(
                            type: FormFieldType.experience, value: value));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        ButtonGradient(
                          btnName: 'ถัดไป',
                          onClick: () {
                            context.read<RegisterProfileBloc>().add(
                                ChangeProfileView(
                                    profileType: ProfileType.uploadDocument));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
