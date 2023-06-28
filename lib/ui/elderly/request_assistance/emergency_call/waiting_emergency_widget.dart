import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/dialog/accept_two_condition_dialog.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/button_white.dart';
import 'package:health_application/ui/elderly/request_assistance/bloc/request_assistance_bloc.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

import '../../../ui-extensions/color.dart';

class WaitingEmergencyWidget extends StatelessWidget {
  const WaitingEmergencyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/emergency_bg.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  BackButtonWidget(
                    onClick: () {
                      context.go(Routes.home);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              textSubtitle24W700(
                  'กำลังขอ\nความช่วยเหลือฉุกเฉิน...', color.white,
                  align: TextAlign.center),
              textButton1(
                  'จากรายชื่อผู้ติดต่อ, จิตอาสาที่อยู่บริเวณ\nใกล้เคียงและเจ้าหน้าที่เครือข่าย',
                  color.white,
                  align: TextAlign.center,
                  maxLines: 2),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/emergency_waiting_help.gif',
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ButtonWhite(
                  onClick: () async {
                    final bool acceptClose = await showDialog(
                        context: context,
                        builder: (BuildContext context) => AcceptTwoCondition(
                              header: 'ปลอดภัยแล้ว',
                              subtitle:
                                  'กรุณากดยืนยัน\nเพื่อยืนยันการได้รับ\nความช่วยเหลือแล้ว',
                            )) as bool;

                    if (acceptClose) {
                      context.read<RequestAssistanceBloc>().add(SubmitIsSafe());
                    }
                  },
                  btnName: 'ฉันปลอดภัยแล้ว',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
