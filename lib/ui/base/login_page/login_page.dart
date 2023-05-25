import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';

import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: ColorTheme().white,
        backgroundColor: ColorTheme().white,
        leading: BackButtonWidget(onClick: () {
          Navigator.pop(context, true);
        }),
      ),
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
                  text: '',
                  maxLength: 50,
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
                  maxLength: 50,
                  hintText: 'รหัสผ่าน',
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonGradient(
                  btnName: 'เข้าสู่ระบบ',
                  onClick: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: textButton1(
                        'ลืมรหัสผ่านหรือไม่?', ColorTheme().Primary)),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textButton2('ยังไม่มีบัญชี?  ', ColorTheme().black87),
                    textButton1('ลงทะเบียน', ColorTheme().Primary),
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
