import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/signIn_page/bloc/sign_in_bloc.dart';
import 'package:health_application/ui/signIn_page/forgot_password/model/verify_reset_password.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_bloc.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_event.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_state.dart';
import 'package:health_application/ui/user_profile/profile_information/view/otp_textfield.dart';

import 'bloc/forgot_password_bloc.dart';

class VertifyOTPWidget extends StatelessWidget {
  const VertifyOTPWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return Scaffold(
          appBar: appBar(
              onBack: () {
                context
                    .read<SignInBloc>()
                    .add(ChangeSection(view: SectionView.forgotPassword));
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: textSubtitle24W700(
                              'ยืนยันเบอร์มือถือของคุณ', ColorTheme().black87),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: textSubtitle2(
                              'โปรดกรอกรหัส OTP ที่ส่งไปยังเบอร์',
                              ColorTheme().black87,
                              true),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: textSubtitle2(
                              'xxx-xxx-${state.phone.lastChars(4)} (ref: ${state.requestOtpResponse.ref}'
                              ')',
                              ColorTheme().black87,
                              true),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        OtpTextField(
                          text: state.otpVerify,
                          onChange: (value) {
                            context
                                .read<ForgotPasswordBloc>()
                                .add(InputOtpVerify(otp: value));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (state.verifyStatus == VerifyStatus.fail) ...{
                          Column(
                            children: [
                              textCaption1(
                                  'รหัส OTP ไม่ถูกต้อง กรุณากรอกรหัสใหม่อีกครั้ง',
                                  ColorTheme().Error),
                              const SpaceWidget(
                                height: 10,
                              )
                            ],
                          )
                        },
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textCaption1(
                                'ไม่ได้รับรหัส OTP?', ColorTheme().black87),
                            (state.requestOtpState ==
                                    RequestingOTPState.requesting)
                                ? Row(
                                    children: [
                                      textCaption1(' ส่งรหัสอีกครั้ง ใน ',
                                          ColorTheme().black87),
                                      textCaption1(state.countDownTime,
                                          ColorTheme().Primary),
                                      textCaption1(
                                          ' นาที', ColorTheme().black87)
                                    ],
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      context
                                          .read<ForgotPasswordBloc>()
                                          .add(RequestPasswordReset());
                                    },
                                    child: textCaption1('  ส่งรหัสอีกครั้ง',
                                        ColorTheme().Primary))
                          ],
                        )
                      ],
                    ),
                    ButtonGradient(
                      btnName: 'ยืนยัน',
                      onClick: () {
                        if (state.otpVerify.length == 4) {
                          context.read<ForgotPasswordBloc>().add(
                              VertifyResetPasswordState(
                                  verifyRequestBody: VertifyResetPassword(
                                      username: state.phone,
                                      token: state.requestOtpResponse.token,
                                      code: state.otpVerify)));
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
