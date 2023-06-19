import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/emergency_detail_card/bloc/emergency_detail_card_bloc.dart';
import 'package:health_application/ui/base/widget/button_red.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../ui-extensions/color.dart';

class WaitingAssistance extends StatelessWidget {
  const WaitingAssistance({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: color.DarkRed.withOpacity(0.12),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: color.DarkRed)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/silane_red.png',
                scale: 4,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textSubtitle16Blod('ขอความช่วยเหลือฉุกเฉิน', color.redText),
                  textBody2('นายสมบัติ สุวรรณโชติ', color.redText, false),
                  Container(
                      width: sized.width * 0.7,
                      child: textBody2(
                          '3000 ถนนพหลโยธิน แขวงจอมพล เขตจตุจักร กรุงเทพมหานคร 10900',
                          color.redText,
                          false))
                ],
              ),
            ],
          ),
          Divider(
            color: color.DarkRed,
            thickness: 0.2,
          ),
          Row(
            children: [
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Image.asset(
                      'assets/images/location_blue.png',
                      color: color.redText,
                      scale: 4,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textBody2('ระยะห่างจากคุณ', color.redText, false),
                      textBody2('2.4 กม. (28 น.)', color.redText, false),
                    ],
                  )
                ],
              )),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          context.read<EmergencyDetailCardBloc>().add(
                              UpdateStatus(
                                  status: EmergencyStatus.AcceptAssitance));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          constraints:
                              BoxConstraints(maxHeight: 45, minHeight: 20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: ColorTheme().DarkRed),
                          child: Center(
                            child: textBody2(
                                'ช่วยเหลือ', ColorTheme().white, false),
                          ),
                        ),
                      )))
            ],
          )
        ],
      ),
    );
  }
}
