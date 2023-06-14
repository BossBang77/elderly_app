import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/signIn_page/signIn_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class VolunteerPrivacyProfile extends StatelessWidget {
  const VolunteerPrivacyProfile({super.key, required this.state});
  final RegisterProfileState state;
  @override
  Widget build(BuildContext context) {
    var user = state.registerModel;
    return Scaffold(
      backgroundColor: ColorTheme().white,
      appBar: appBar(onBack: () {
        context
            .read<RegisterProfileBloc>()
            .add(ChangeProfileView(profileType: ProfileType.role));
      }),
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
                text: user.username,
                maxLength: 10,
                textNumberType: true,
                hintText: '081 234 5678',
                onChanged: (value) {
                  context.read<RegisterProfileBloc>().add(FormFillType(
                        type: FillType.username,
                        value: value,
                      ));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              textSubtitle18Blod('รหัสผ่าน', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget.enable(
                text: user.password,
                suffix: true,
                onTap: () {
                  context.read<RegisterProfileBloc>().add(ObscurePassword());
                },
                obscureText: state.obscurePassword,
                imagePath: 'assets/images/obseure_password.png',
                maxLength: 50,
                hintText: 'รหัสผ่าน',
                onChanged: ((value) {
                  context.read<RegisterProfileBloc>().add(FormFillType(
                        type: FillType.password,
                        value: value,
                      ));
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              textSubtitle18Blod('รหัสจิตอาสา', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget.enable(
                text: user.volunteerCode,
                textNumberType: true,
                maxLength: 4,
                hintText: 'ตัวเลข 4 ตัว',
                onChanged: (value) {
                  context.read<RegisterProfileBloc>().add(FormFillType(
                        type: FillType.volunteerCode,
                        value: value,
                      ));
                },
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
                text: user.elderlyCareCode,
                textNumberType: true,
                maxLength: 4,
                hintText: 'รหัสเครือข่าย',
                onChanged: (value) {
                  context.read<RegisterProfileBloc>().add(FormFillType(
                        type: FillType.elderlyCareCode,
                        value: value,
                      ));
                },
              ),
              const SizedBox(
                height: 40,
              ),
              ButtonGradient(
                btnName: 'ลงทะเบียน',
                onClick: () {
                  if (user.username.isNotEmpty && user.password.isNotEmpty) {
                    context.read<RegisterProfileBloc>().add(ChangeProfileView(
                        profileType: ProfileType.personalInformation));
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textButton2('มีบัญชี?  ', ColorTheme().black87),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignInPage()));
                      },
                      child: textButton1('เข้าสู่ระบบ', ColorTheme().Primary)),
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
