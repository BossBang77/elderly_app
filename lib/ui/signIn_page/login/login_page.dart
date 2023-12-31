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
import '../forgot_password/bloc/forgot_password_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.state});
  final SignInState state;

  @override
  Widget build(BuildContext context) {
    var _signIn = state.signIn;
    bool usernameEmpty = (state.signInStatus == SignInStatus.mandatoryWrong &&
        state.signIn.username.isEmpty);
    bool usernameValidate =
        (usernameEmpty) || (state.signInStatus == SignInStatus.userNotfound);
    bool passwordEmpty = (state.signInStatus == SignInStatus.mandatoryWrong &&
        state.signIn.password.isEmpty);
    bool passwordValidate =
        (passwordEmpty) || (state.signInStatus == SignInStatus.wrongPassword);
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
                  hintText: 'เบอร์มือถือของคุณ',
                  errorText: state.signInStatus == SignInStatus.userNotfound
                      ? 'ไม่พบเบอร์มือถือผู้ใช้งานในระบบ'
                      : 'กรุณากรอกข้อมูลให้ครบถ้วน',
                  autoValid: usernameValidate,
                  setError: usernameValidate,
                  setErrorWithOuter: usernameValidate,
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
                  errorText: state.signInStatus == SignInStatus.wrongPassword
                      ? 'รหัสผ่านไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง'
                      : 'กรุณากรอกข้อมูลให้ครบถ้วน',
                  autoValid: passwordValidate,
                  setError: passwordValidate,
                  setErrorWithOuter: passwordValidate,
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
                    context.read<SignInBloc>().add(SubmitLogin());
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
                    context.read<ForgotPasswordBloc>().add(InitialData());
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
