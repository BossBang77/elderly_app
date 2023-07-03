import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/register_profile/register_profile_page.dart';
import 'package:health_application/ui/signIn_page/bloc/sign_in_bloc.dart';

import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../base/widget/app_bar_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.state});
  final SignInState state;

  @override
  Widget build(BuildContext context) {
    var _signIn = state.signIn;
    return Scaffold(
      appBar: appBar(onBack: () {
        context.go(Routes.root);
      }),
      backgroundColor: ColorTheme().white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/login_logo.png',
                    scale: 2,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: textSubtitle24('เข้าสู่ระบบ', ColorTheme().black87)),
                const SizedBox(
                  height: 20,
                ),
                textSubtitle18Blod('เบอร์มือถือของคุณ', ColorTheme().black87),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget.enable(
                  text: _signIn.username,
                  maxLength: 10,
                  hintText: '081 234 5678',
                  onChanged: (value) {
                    context
                        .read<SignInBloc>()
                        .add(UpdateUsername(username: value));
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
                  text: _signIn.password,
                  suffix: true,
                  onTap: () {
                    context.read<SignInBloc>().add(ObscurePassword());
                  },
                  obscureText: state.obscurePassword,
                  imagePath: 'assets/images/obseure_password.png',
                  maxLength: 50,
                  hintText: 'รหัสผ่าน',
                  onChanged: (value) {
                    context
                        .read<SignInBloc>()
                        .add(UpdatePassword(password: value));
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonGradient(
                  btnName: 'เข้าสู่ระบบ',
                  onClick: () {
                    if (_signIn.username.isNotEmpty &&
                        _signIn.password.isNotEmpty) {
                      context.read<SignInBloc>().add(SubmitLogin());
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: InkWell(
                  onTap: () {
                    context
                        .read<SignInBloc>()
                        .add(ChangeSection(view: SectionView.forgotPassword));
                  },
                  child:
                      textButton1('ลืมรหัสผ่านหรือไม่?', ColorTheme().Primary),
                )),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textButton2('ยังไม่มีบัญชี?  ', ColorTheme().black87),
                    InkWell(
                        onTap: () {
                          context.push(Routes.register);
                        },
                        child: textButton1('ลงทะเบียน', ColorTheme().Primary)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
