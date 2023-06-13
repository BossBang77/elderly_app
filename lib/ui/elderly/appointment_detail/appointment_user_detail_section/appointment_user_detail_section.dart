import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/button_blue_fade.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail_section/appointment_detail_item.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AppointmentUserDetailSection extends StatelessWidget {
  const AppointmentUserDetailSection({required this.appointment});

  final Appointment appointment;

  @override 
  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme().white,
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textSubtitle1('ข้อมูลการดูแลผู้สูงอายุ', ColorTheme().black87),
          SizedBox(height: 32),
          AppointmentDetailItem(
            title: 'ชื่อ', 
            description: appointment.eldery.name, 
            image: 'assets/images/person_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'เพศ/อายุ', 
            description: '${appointment.eldery.gender} (${appointment.eldery.age} ปี)', 
            image: 'assets/images/person_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'เบอร์ติดต่อ', 
            description: '${appointment.eldery.mobileNumber}', 
            image: 'assets/images/phone_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'โรคประจำตัว', 
            description: appointment.eldery.congenitalDisease.map((disease) => disease.name).toList().join(', '),
            // description: 'โรคความดันโลหิตสูง, โรคเบาหวาน,โรคภูมิคุ้มกันบกพร่อง , โรคอ้วน', 
            image: 'assets/images/board_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'การแพ้อาหาร', 
            description: appointment.eldery.allergicFoods.map((allergic) => allergic.name).toList().join(', '), 
            image: 'assets/images/board_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'รายละเอียดเพิ่มเติมถึงจิตอาสา', 
            description: appointment.note, 
            image: 'assets/images/clock_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'สถานที่นัดหมาย', 
            description: '3000 ถนนพหลโยธิน แขวงจอมพล เขตจตุจักร กรุงเทพมหานคร 10900', 
            image: 'assets/images/location_blue.png'
          ),
        ],
      ),
    );
  }
}