import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/dialog/success_dialog.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/elderly/change_password/bloc/change_password_bloc.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key, required this.profile});
  final RegisterModel profile;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordBloc(),
      child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
        listener: (BuildContext context, ChangePasswordState state) async {
          if (state.status == ChangePasswordStatus.changeFail) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertWidget(
                      title: 'เกิดข้อผิดพลาด',
                      subTitle:
                          "เปลี่ยนรหัสผ่านไม่สำเร็จ\nกรุณาลองใหม่อีกครั้ง",
                      btnName: 'ตกลง',
                    )) as bool;

            if (acceptClose) {
              context.read<ChangePasswordBloc>().add(ResetChangeStatus());
            }
          }

          if (state.status == ChangePasswordStatus.changeSuccess) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext _) => SuccessDialog(
                      header: "สำเร็จ!",
                      subtitle:
                          "เปลี่ยนรหัสผ่านสำเร็จ\nกรุณาล็อกอินใหม่อีกครั้ง",
                      buttonName: 'ตกลง',
                      onTap: () {},
                    ));

            if (acceptClose) {
              context.read<ChangePasswordBloc>().add(ResetChangeStatus());
              context.go(Routes.root);
            }
          }
        },
        builder: (BuildContext context, ChangePasswordState state) {
          bool checkNewPassword = state.newPassword != state.confirmPassword;
          return Scaffold(
              backgroundColor: ColorTheme().white,
              appBar: appBar(
                  onBack: () {
                    Navigator.pop(context);
                  },
                  title: 'เปลี่ยนรหัสผ่าน'),
              body: Stack(
                children: [
                  SingleChildScrollView(
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
                                  text: state.oldPassword,
                                  suffix: true,
                                  onTap: () {
                                    context
                                        .read<ChangePasswordBloc>()
                                        .add(ObscureOldPassword());
                                  },
                                  onChanged: (value) {
                                    context.read<ChangePasswordBloc>().add(
                                        ChangeOldPassword(oldPassword: value));
                                  },
                                  obscureText: state.obscureOldPassword,
                                  imagePath:
                                      'assets/images/obseure_password.png',
                                  maxLength: 50,
                                  hintText: 'รหัสผ่าน',
                                  errorText: 'รหัสผ่านปัจจุบันไม่ถูกต้อง',
                                  setError: state.oldPasswordWrong,
                                  autoValid: state.oldPasswordWrong,
                                  setErrorWithOuter: state.oldPasswordWrong,
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
                                  text: state.newPassword,
                                  suffix: true,
                                  onTap: () {
                                    context
                                        .read<ChangePasswordBloc>()
                                        .add(ObscureNewPassword());
                                  },
                                  onChanged: (value) {
                                    context.read<ChangePasswordBloc>().add(
                                        ChangeNewPassword(newPassword: value));
                                  },
                                  obscureText: state.obscureNewPassword,
                                  imagePath:
                                      'assets/images/obseure_password.png',
                                  maxLength: 50,
                                  hintText: 'รหัสผ่านใหม่',
                                  setError: checkNewPassword,
                                  autoValid: checkNewPassword,
                                  setErrorWithOuter: checkNewPassword,
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
                                  text: state.confirmPassword,
                                  suffix: true,
                                  onTap: () {
                                    context
                                        .read<ChangePasswordBloc>()
                                        .add(ObscureConfirmPassword());
                                  },
                                  onChanged: (value) {
                                    context.read<ChangePasswordBloc>().add(
                                        ChangeConfirmPassword(
                                            confirmPassword: value));
                                  },
                                  obscureText: state.obscureConfirmPassword,
                                  imagePath:
                                      'assets/images/obseure_password.png',
                                  maxLength: 50,
                                  hintText: 'ยืนยันรหัสผ่านใหม่',
                                  setError: checkNewPassword,
                                  autoValid: checkNewPassword,
                                  setErrorWithOuter: checkNewPassword,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            ButtonGradient(
                              btnName: 'เปลี่ยนรหัสผ่าน',
                              onClick: () {
                                if ((!checkNewPassword) &&
                                    (state.newPassword.isNotEmpty &&
                                        state.confirmPassword.isNotEmpty &&
                                        state.oldPassword.isNotEmpty))
                                  context
                                      .read<ChangePasswordBloc>()
                                      .add(SubmitChangePassword());
                              },
                            )
                          ],
                        )),
                  ),
                  if (state.isLoading) Loader()
                ],
              ));
        },
      ),
    );
  }
}
