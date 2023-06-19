import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:collection/collection.dart';


class AppointmentStatusSection extends StatelessWidget {
  const AppointmentStatusSection({required this.appointment});
  
  final Appointment appointment;
  
  @override 
  Widget build(BuildContext context) {
    final status = AppointmentStatus.fromString(appointment.status);

    return Container(
      color: ColorTheme().white,
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              textSubtitle1('สถานะการนัดหมาย : ', ColorTheme().black87),
              textSubtitle1(status?.title ?? '', ColorTheme().blueText)
            ],
          ),
          SizedBox(height: 24),
          AppointmentStatusStep(
            stepValues: AppointmentStatus.values.where((element) => element != AppointmentStatus.reject).mapIndexed((index, status) => 
              AppointmentStatusItem(value: status, title: (index + 1).toString(), description: status.title)
            ).toList(), 
            width: MediaQuery.of(context).size.width - 48,
            currentStep: status,
          )
        ]
      ),
    );  
  }
}

enum AppointmentStatus {
  create(title: 'รอการยืนยัน', value: 'CREATE'),
  waitingtostart(title: 'รอเริ่มงาน', value: 'WAITING_TO_START'),
  start(title: 'เริ่มงาน', value: 'START'),
  complete(title: 'สำเร็จ', value: 'COMPLETE'),
  reject(title: 'ยกเลิก', value: 'REJECT');

  const AppointmentStatus({
    required this.title,
    required this.value
  });

  final String title;
  final String value;

  static AppointmentStatus? fromString(String status) {
    if (status == 'CREATE') {
      return AppointmentStatus.create;
    }
    if (status == 'WAITING_TO_START') {
      return AppointmentStatus.waitingtostart;
    }
    if (status == 'START') {
      return AppointmentStatus.start;
    }
    if (status == 'COMPLETE') {
      return AppointmentStatus.complete;
    }
    if (status == 'REJECT') {
      return AppointmentStatus.reject;
    }
  }
}