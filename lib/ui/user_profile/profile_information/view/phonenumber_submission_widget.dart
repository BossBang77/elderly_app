import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/signIn_page/bloc/sign_in_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_bloc.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_event.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_state.dart';
import 'package:health_application/ui/user_profile/profile_information/view/otp_submission_widget.dart';
import 'package:provider/provider.dart';

class PhoneNumberSubmissionWidget extends StatelessWidget {
  const PhoneNumberSubmissionWidget({super.key, required this.state});

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
                  textSubtitle18Blod('เบอร์มือถือของคุณ', ColorTheme().black87),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget.enable(
                    text: state.phoneNumber,
                    maxLength: 10,
                    hintText: '081 234 5678',
                    onChanged: (value) {
                      context
                          .read<RequestOtpBloc>()
                          .add(RequestOtpPhoneNumberValueChanged(value: value));
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
                  context
                      .read<RequestOtpBloc>()
                      .add(RequestOtpSendOtpRequest());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
