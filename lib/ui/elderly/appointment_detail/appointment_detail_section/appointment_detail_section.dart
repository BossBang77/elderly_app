import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail_section/appointment_detail_item.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AppointmentDetailSection extends StatelessWidget {
  const AppointmentDetailSection({
    required this.appointment
  });
  
  final Appointment appointment;

  @override 
  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme().white,
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textSubtitle1('ข้อมูลการนัดหมายจิตอาสา', ColorTheme().black87),
          SizedBox(height: 32),
          AppointmentDetailItem(
            title: 'ประเภทการนัดหมาย', 
            description: appointment.types.map((type) => type.name).join(', '),
            image: 'assets/images/menu_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'วันที่นัดหมาย', 
            description: appointment.appointmentDate, 
            image: 'assets/images/calendar_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'เวลานัดหมาย', 
            description: appointment.appointmentTimes.map((time) => time.name).join(', '), 
            image: 'assets/images/clock_blue.png'
          )
        ],
      ),
    );
  }
}