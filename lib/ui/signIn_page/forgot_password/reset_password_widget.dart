import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/dialog/success_dialog.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/signIn_page/bloc/sign_in_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../base/widget/text_field_widget.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorTheme().white,
        appBar: appBar(
            onBack: () {
              context
                  .read<SignInBloc>()
                  .add(ChangeSection(view: SectionView.login));
            },
            title: 'ลืมรหัสผ่าน'),
        body: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: textSubtitle24W700(
                        'ตั้งค่ารหัสผ่าน', ColorTheme().black87),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  textSubtitle18Blod('รหัสผ่านใหม่', ColorTheme().black87),
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
                  textSubtitle18Blod('รหัสผ่านใหม่', ColorTheme().black87),
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
                    hintText: 'ยืนยันรหัสผ่านใหม่',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ButtonGradient(
                    btnName: 'ยืนยัน',
                    onClick: () {
                      // TODO Integrate
                      showDialog(
                          context: context,
                          builder: (BuildContext _) => SuccessDialog(
                                header: "สำเร็จ!",
                                subtitle: "ตั้งค่ารหัสผ่านสำเร็จแล้ว",
                                buttonName: 'เข้าสู่ระบบ',
                                onTap: () {
                                  Navigator.pop(context, true);
                                  context.read<SignInBloc>().add(
                                      ChangeSection(view: SectionView.login));
                                },
                              ));
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
