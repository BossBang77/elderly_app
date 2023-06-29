import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/dialog/success_dialog.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/elderly/change_password/bloc/change_password_bloc.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key, required this.profile});
  final RegisterModel profile;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordBloc(),
      child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
        listener: (BuildContext context, ChangePasswordState state) {
          // TODO: implement listener
        },
        builder: (BuildContext context, ChangePasswordState state) {
          return Scaffold(
              backgroundColor: ColorTheme().white,
              appBar: appBar(
                  onBack: () {
                    Navigator.pop(context);
                  },
                  title: 'เปลี่ยนรหัสผ่าน'),
              body: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            textSubtitle18Blod(
                                'รหัสผ่านปัจจุบัน', ColorTheme().black87),
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
                                'รหัสผ่านใหม่', ColorTheme().black87),
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
                              hintText: 'รหัสผ่านใหม่',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            textSubtitle18Blod(
                                'ยืนยันรหัสผ่านใหม่', ColorTheme().black87),
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
                              height: 20,
                            ),
                          ],
                        ),
                        ButtonGradient(
                          btnName: 'เปลี่ยนรหัสผ่าน',
                          onClick: () {
                            // TODO Integrate
                            showDialog(
                                context: context,
                                builder: (BuildContext _) => SuccessDialog(
                                      header: "สำเร็จ!",
                                      subtitle: "เปลี่ยนรหัสผ่านสำเร็จ",
                                      buttonName: 'ตกลง',
                                      onTap: () {
                                        Navigator.pop(context, true);
                                      },
                                    ));
                          },
                        )
                      ],
                    )),
              ));
        },
      ),
    );
  }
}
