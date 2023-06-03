import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        textSubtitle16Blod('ข้อมูลของคุณ', color.black87),
        const SizedBox(
          height: 10,
        ),
        textSubtitle16Blod('ชื่อ', color.black87),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: sized.width,
          padding: EdgeInsets.all(15),
          decoration: StyleBorder().greyDecoration(radius: 15),
          child: textButton1('นางทองใบ', color.black87),
        ),
        //เบอร์ติดต่อ
        const SizedBox(
          height: 10,
        ),
        textSubtitle16Blod('เบอร์ติดต่อ', color.black87),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: sized.width,
          padding: EdgeInsets.all(15),
          decoration: StyleBorder().greyDecoration(radius: 15),
          child: textButton1('089 666 7546', color.black87),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: Image.asset('assets/images/person_icon.png', scale: 3)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 2, child: textButton1('เพศหญิง (85 ปี)', color.black87))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: Image.asset('assets/images/board_detail.png', scale: 3)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 2,
                child: textButton1(
                    'โรคความดันโลหิตสูง, โรคเบาหวาน โรคภูมิคุ้มกันบกพร่อง , โรคอ้วน',
                    color.black87,
                    maxLines: 10))
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: Image.asset('assets/images/board_detail.png', scale: 3)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 2,
                child: textButton1('นมวัว, แป้งสาลีและกลูเต็น ', color.black87,
                    maxLines: 10))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Divider(),
        const SizedBox(
          height: 20,
        ),
        textSubtitle16Blod('รายละเอียดเพิ่มเติมถึงจิตอาสา', color.black87),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget.enable(
          text: '',
          maxLength: 500,
          multiLine: true,
          minLines: 5,
          hintText: 'รายละเอียดเพิ่มเติม',
        ),
        const SizedBox(
          height: 40,
        ),
        Divider(),
        const SizedBox(
          height: 20,
        ),
        textSubtitle16Blod('สถานที่นัดหมาย', color.black87),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/location_icon.png',
                scale: 3,
              ),
            ),
            Expanded(
              flex: 6,
              child: textButton1(
                  '3000 ถนนพหลโยธิน แขวงจอมพล เขตจตุจักร กรุงเทพมหานคร 10900',
                  color.black87,
                  maxLines: 2),
            ),
            Expanded(
              child: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            )
          ],
        ),
      ],
    );
  }
}
