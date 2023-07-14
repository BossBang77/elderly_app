import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/dialog/success_dialog.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/signIn_page/bloc/sign_in_bloc.dart';
import 'package:health_application/ui/signIn_page/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:health_application/ui/signIn_page/forgot_password/model/request_submit_new_password.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../base/widget/text_field_widget.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
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
                        text: state.newPassword,
                        suffix: true,
                        onTap: () {
                          context.read<ForgotPasswordBloc>().add(
                              ObscureNewPassword(
                                  isHide: !state.obscureNewPassword));
                        },
                        obscureText: state.obscureNewPassword,
                        imagePath: 'assets/images/obseure_password.png',
                        maxLength: 50,
                        hintText: 'รหัสผ่าน',
                        onChanged: (value) {
                          context
                              .read<ForgotPasswordBloc>()
                              .add(InputNewPassword(password: value));
                        },
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
                          context.read<ForgotPasswordBloc>().add(
                              ObscureConfimPassword(
                                  isHide: !state.obscureConfirmPassword));
                        },
                        obscureText: state.obscureConfirmPassword,
                        imagePath: 'assets/images/obseure_password.png',
                        maxLength: 50,
                        hintText: 'ยืนยันรหัสผ่านใหม่',
                        onChanged: (value) {
                          context
                              .read<ForgotPasswordBloc>()
                              .add(InputConfimPassword(password: value));
                        },
                        setError: state.confirmPassword.isNotEmpty &&
                            (state.newPassword != state.confirmPassword),
                        setErrorWithOuter: state.confirmPassword.isNotEmpty &&
                            (state.newPassword != state.confirmPassword),
                        errorText: 'รหัสผ่านใหม่ไม่ตรงกัน',
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ButtonGradient(
                        btnName: 'ยืนยัน',
                        onClick: () {
                          if ((state.newPassword.isNotEmpty &&
                                  state.confirmPassword.isNotEmpty) &&
                              (state.newPassword == state.confirmPassword)) {
                            context.read<ForgotPasswordBloc>().add(
                                SubmitResetPassword(
                                    submitMol: RequestSubmitNewPasswordModel(
                                        password: state.newPassword,
                                        username: state.phone,
                                        resetPasswordToken:
                                            state.resetPasswordToken)));
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
