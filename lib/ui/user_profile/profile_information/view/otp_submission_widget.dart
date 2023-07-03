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
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_bloc.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_event.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_state.dart';
import 'package:health_application/ui/user_profile/profile_information/view/otp_textfield.dart';

class OtpSubmissionWidget extends StatelessWidget {
  const OtpSubmissionWidget({super.key, required this.state});

  final RequestOtpState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    child: textSubtitle2('โปรดกรอกรหัส OTP ที่ส่งไปยังเบอร์',
                        ColorTheme().black87, true),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: textSubtitle2(
                        'xxx-xxx-${state.phoneNumber.lastChars(4)} (ref:${state.requestOtpResponse.ref} )',
                        ColorTheme().black87,
                        true),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  OtpTextField(
                    text: state.otp,
                    onChange: (value) {
                      context
                          .read<RequestOtpBloc>()
                          .add(RequestOtpOtpValueChanged(value: value));
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  if (state.phoneNumberSubmitState ==
                      PhoneNumberSubmitState.failure) ...{
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
                      textCaption1('ไม่ได้รับรหัส OTP?', ColorTheme().black87),
                      (state.requestOtpState == RequestingState.requesting)
                          ? Row(
                              children: [
                                textCaption1(' ส่งรหัสอีกครั้ง ใน ',
                                    ColorTheme().black87),
                                textCaption1('${state.countDownTime}',
                                    ColorTheme().Primary),
                                textCaption1(' นาที', ColorTheme().black87)
                              ],
                            )
                          : GestureDetector(
                              onTap: () {
                                context
                                    .read<RequestOtpBloc>()
                                    .add(RequestOtpSendOtpRequest());
                              },
                              child: textCaption1(
                                  '  ส่งรหัสอีกครั้ง', ColorTheme().Primary))
                    ],
                  )
                  //04:57 นาที
                ],
              ),
              ButtonGradient(
                btnName: 'ยืนยัน',
                onClick: () {
                  context
                      .read<RequestOtpBloc>()
                      .add(RequestOtpSendOtpConfirmation(otp: state.otp));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
