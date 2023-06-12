import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail_section/appointment_detail_item.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AppointmentDetailSection extends StatelessWidget {
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
            description: 'ดูแลผู้สูงอายุ, ทำกายภาพบำบัด', 
            image: 'assets/images/menu_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'วันที่นัดหมาย', 
            description: '20 ตุลาคม 2565', 
            image: 'assets/images/calendar_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'เวลานัดหมาย', 
            description: '08:00 - 09:00 น. 09:00 - 10:00 น.\n10:00 - 11:00 น. 11:00 - 12:00 น.', 
            image: 'assets/images/clock_blue.png'
          )
        ],
      ),
    );
  }
}