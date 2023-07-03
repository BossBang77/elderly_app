import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/dialog/success_dialog.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_bloc.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_event.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_state.dart';
import 'package:health_application/ui/user_profile/profile_information/view/otp_submission_widget.dart';
import 'package:health_application/ui/user_profile/profile_information/view/phonenumber_submission_widget.dart';

class RequestOtpPage extends StatelessWidget {
  Widget displayWidget(RequestOtpState state) {
    switch (state.displayState) {
      case RequestOtpDisplayState.phoneSubmission:
        return PhoneNumberSubmissionWidget(state: state);
      case RequestOtpDisplayState.optSubmission:
        return OtpSubmissionWidget(state: state);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestOtpBloc(),
      child: BlocConsumer<RequestOtpBloc, RequestOtpState>(
        listener: (context, state) async {
          if (state.requestOtpState == RequestingState.failure) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertWidget(
                      title: 'เกิดข้อผิดพลาด',
                      subTitle:
                          "ไม่สามารถส่งรหัสOTPได้ในขณะนี้\nกรุณาลองใหม่อีกครั้ง",
                      btnName: 'ตกลง',
                    )) as bool;

            if (acceptClose) {
              context.read<RequestOtpBloc>().add(ResetRequestOtpState());
            }
          }

          if (state.phoneNumberSubmitState == PhoneNumberSubmitState.success) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext _) => SuccessDialog(
                      header: "สำเร็จ!",
                      subtitle: 'ยืนยันเบอร์มือถือสำเร็จ',
                      buttonName: 'ตกลง',
                      onTap: () {},
                    ));

            if (acceptClose) {
              context.read<RequestOtpBloc>().add(ResetPhoneNumberSubmit());
              Navigator.of(context).pop(state.phoneNumber);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: ColorTheme().white,
              appBar: appBar(
                  onBack: () {
                    Navigator.of(context).pop('');
                  },
                  title: 'ลืมรหัสผ่าน'),
              body: BlocBuilder<RequestOtpBloc, RequestOtpState>(
                builder: (context, state) => Container(
                  child: displayWidget(state),
                ),
              ));
        },
      ),
    );
  }
}
