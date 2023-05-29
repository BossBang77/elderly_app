import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../base/widget/text_field_widget.dart';

class PrivacyProfile extends StatelessWidget {
  const PrivacyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme().white,
      appBar: appBar(onBack: () {}),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(child: textSubtitle24('ลงทะเบียน', ColorTheme().black87)),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 20,
              ),
              textSubtitle18Blod('เบอร์มือถือของคุณ', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget.enable(
                text: '',
                maxLength: 10,
                textNumberType: true,
                hintText: '081 234 5678',
              ),
              const SizedBox(
                height: 20,
              ),
              textSubtitle18Blod('รหัสผ่าน', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget.enable(
                text: '',
                suffix: true,
                onTap: () {},
                obscureText: true,
                imagePath: 'assets/images/obseure_password.png',
                maxLength: 50,
                hintText: 'รหัสผ่าน',
              ),
              const SizedBox(
                height: 20,
              ),
              textSubtitle18Blod(
                  'รหัสเครือข่ายดูแลผู้สูงอายุ (ถ้ามี)', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget.enable(
                text: '',
                textNumberType: true,
                maxLength: 4,
                hintText: 'รหัสเครือข่าย',
              ),
              const SizedBox(
                height: 40,
              ),
              ButtonGradient(
                btnName: 'ลงทะเบียน',
                onClick: () {
                  context.read<RegisterProfileBloc>().add(
                      ChangeProfileView(profileType: ProfileType.bmiProfile));
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textButton2('มีบัญชี?  ', ColorTheme().black87),
                  textButton1('เข้าสู่ระบบ', ColorTheme().Primary),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
