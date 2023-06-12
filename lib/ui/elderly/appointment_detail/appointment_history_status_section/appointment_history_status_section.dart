import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_history_status_section/appointment_history_status.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AppointmentHistoryStatusSection extends StatelessWidget {
  const AppointmentHistoryStatusSection({required this.status});

  final AppointmentHistoryStatus status;

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
              Container(
                width: 24,
                height: 24,
                child: Image.asset(status.image, width: 24, height: 24),
              ),
              SizedBox(width: 6),
              textSubtitle1(status.title, status.color)
            ],
          )
        ]
      ),
    );
  }
}