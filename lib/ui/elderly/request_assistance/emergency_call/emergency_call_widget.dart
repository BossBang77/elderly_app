import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/elderly/request_assistance/bloc/request_assistance_bloc.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class EmergrncyCallWidget extends StatelessWidget {
  const EmergrncyCallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: color.white,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/emergency_icon.gif',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: sized.width,
              height: sized.height,
              margin: EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      textSubtitle18Blod('Emergency call', color.emergency),
                      const SizedBox(
                        height: 20,
                      ),
                      textSubtitle24W700(
                          'คุณต้องการ\nความช่วยเหลือหรือไม่?', color.black87,
                          align: TextAlign.center),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        context.read<RequestAssistanceBloc>().add(UpdateStatus(
                            status: AssistanceStatus.waitingForHelp));
                      },
                      child: Container(
                        padding: EdgeInsets.all(150),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  textSubtitle16Blod(
                      'กดปุ่มเพื่อขอความช่วยเหลือฉุกเฉิน', color.black87),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 70,
              left: 30,
              child: BackButtonWidget(
                onClick: () {
                  context.go(Routes.home);
                },
              ),
            ),
          ],
        ));
  }
}
