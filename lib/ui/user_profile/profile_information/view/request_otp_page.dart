import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_bloc.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/change_mobile_number/request_otp_state.dart';
import 'package:health_application/ui/user_profile/profile_information/view/otp_submission_widget.dart';
import 'package:health_application/ui/user_profile/profile_information/view/phonenumber_submission_widget.dart';

class RequestOtpPage extends StatelessWidget {

  Widget displayWidget(RequestOtpState state) {
    switch (state.displayState) {
      case RequestOtpDisplayState.phoneSubmission: return PhoneNumberSubmissionWidget(state: state);
      case RequestOtpDisplayState.optSubmission: return OtpSubmissionWidget(state: state);
    }
  }

  @override 
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => RequestOtpBloc(),
      child: Scaffold(
        backgroundColor: ColorTheme().white,
        appBar: appBar(
            onBack: () {
              Navigator.of(context).pop();
            },
            title: 'ลืมรหัสผ่าน'),
        body: BlocBuilder<RequestOtpBloc, RequestOtpState>(
          builder:(context, state) => Container(
            child: displayWidget(state) ,
          ),
        )
    ));
  }
}