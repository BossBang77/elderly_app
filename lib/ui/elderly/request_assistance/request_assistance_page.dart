import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/dialog/accept_two_condition_dialog.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/elderly/request_assistance/bloc/request_assistance_bloc.dart';
import 'package:health_application/ui/elderly/request_assistance/emergency_call/assistance_detail_widget.dart';
import 'package:health_application/ui/elderly/request_assistance/emergency_call/emergency_call_widget.dart';
import 'package:health_application/ui/elderly/request_assistance/emergency_call/waiting_emergency_widget.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';

class RequestAssitancePage extends StatelessWidget {
  const RequestAssitancePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget initialWidget(BuildContext context, RequestAssistanceState state) {
      if (state.assistanceStatus == AssistanceStatus.emergencyCall) {
        return EmergrncyCallWidget();
      } else if (state.assistanceStatus == AssistanceStatus.waitingForHelp) {
        return WaitingEmergencyWidget();
      } else if (state.assistanceStatus == AssistanceStatus.volunteerAccept) {
        return AssitstanceDetailWidget();
      } else {
        return Container();
      }
    }

    return BlocProvider(
      create: (context) => RequestAssistanceBloc()..add(GetEmergencyDetail()),
      child: BlocConsumer<RequestAssistanceBloc, RequestAssistanceState>(
        listener: (context, state) async {
          if (state.statusSubmit == StatusSubmit.sendSafeFail) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertWidget(
                      title: 'เกิดข้อผิดพลาด',
                      subTitle: "อัปเดตสถานะไม่สำเร็จ\nกรุณาลองใหม่อีกครั้ง",
                      btnName: 'ตกลง',
                    )) as bool;

            if (acceptClose) {
              context.read<RequestAssistanceBloc>().add(ResetSubmitStatus());
            }
          }

          if (state.statusSubmit == StatusSubmit.createEmergencyFail) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertWidget(
                      title: 'เกิดข้อผิดพลาด',
                      subTitle:
                          "ขอความช่วยเหลือไม่สำเร็จ\nกรุณาลองใหม่อีกครั้ง",
                      btnName: 'ตกลง',
                    )) as bool;

            if (acceptClose) {
              context.read<RequestAssistanceBloc>().add(ResetSubmitStatus());
            }
          }
          if (state.statusSubmit == StatusSubmit.sendSafeSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomePage()),
                (Route<dynamic> route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(children: [
              initialWidget(context, state),
              if (state.isLoading) Loader()
            ]),
          );
        },
      ),
    );
  }
}
