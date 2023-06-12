import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/button_blue_fade.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail_section/appointment_detail_item.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AppointmentUserDetailSection extends StatelessWidget {
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
            description: 'นายสมหมาย มงคลจิต', 
            image: 'assets/images/person_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'เพศ/อายุ', 
            description: 'เพศชาย (78 ปี)', 
            image: 'assets/images/person_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'เบอร์ติดต่อ', 
            description: '089 666 7546', 
            image: 'assets/images/phone_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'โรคประจำตัว', 
            description: 'โรคความดันโลหิตสูง, โรคเบาหวาน,โรคภูมิคุ้มกันบกพร่อง , โรคอ้วน', 
            image: 'assets/images/board_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'การแพ้อาหาร', 
            description: 'นมวัว, แป้งสาลีและกลูเต็น ', 
            image: 'assets/images/board_blue.png'
          ),
          SizedBox(height: 24),
          AppointmentDetailItem(
            title: 'รายละเอียดเพิ่มเติมถึงจิตอาสา', 
            description: 'Lorem ipsum dolor sit amet consectetur. In aliquet purusphasellus bibendum est lobortis tristique lacus lectus. ', 
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