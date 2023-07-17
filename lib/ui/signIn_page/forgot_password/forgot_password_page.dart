import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/signIn_page/bloc/sign_in_bloc.dart';
import 'package:health_application/ui/signIn_page/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

import '../../base/widget/app_bar_widget.dart';
import '../../base/widget/text_field_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: textSubtitle24W700(
                                'กรอกเบอร์มือถือของคุณ', ColorTheme().black87),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: textSubtitle18Blod(
                                'เพื่อทำการยืนยันตัวตน', ColorTheme().black87),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          textSubtitle18Blod(
                              'เบอร์มือถือของคุณ', ColorTheme().black87),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget.enable(
                            text: state.phone,
                            maxLength: 10,
                            hintText: 'เบอร์มือถือของคุณ',
                            errorText: 'ไม่พบเบอร์มือถือผู้ใช้งานในระบบ',
                            setError: state.isExisting == ExistingStatus.isNew,
                            setErrorWithOuter:
                                state.isExisting == ExistingStatus.isNew,
                            onChanged: (value) {
                              context
                                  .read<ForgotPasswordBloc>()
                                  .add(InputPhoneNumber(phone: value));

                              if (value.length == 10) {
                                context
                                    .read<ForgotPasswordBloc>()
                                    .add(CheckPhoneNumber(phoneNumber: value));
                              }
                            },
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                        ],
                      ),
                      ButtonGradient(
                        btnName: 'ขอรหัส OTP',
                        onClick: () {
                          if (state.isExisting == ExistingStatus.isExisting) {
                            context
                                .read<ForgotPasswordBloc>()
                                .add(RequestPasswordReset());
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
