import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:collection/collection.dart';


class AppointmentStatusSection extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme().white,
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              textSubtitle1('สถานะการนัดหมาย : ', ColorTheme().black87),
              textSubtitle1(AppointmentStatus.waitforapprove.title, ColorTheme().blueText)
            ],
          ),
          SizedBox(height: 24),
          AppointmentStatusStep(
            stepValues: AppointmentStatus.values.mapIndexed((index, status) => 
              AppointmentStatusItem(value: status, title: (index + 1).toString(), description: status.title)
            ).toList(), 
            width: MediaQuery.of(context).size.width - 48,
            currentStep: AppointmentStatus.waitforapprove,
          )
        ]
      ),
    );  
  }
}

enum AppointmentStatus {
  waitforapprove(title: 'รอการยืนยัน'),
  waitforstart(title: 'รอเริ่มงาน'),
  start(title: 'เริ่มงาน'),
  done(title: 'สำเร็จ');

  const AppointmentStatus({required this.title});

  final String title;
}