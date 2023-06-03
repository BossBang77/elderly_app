import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/line_date_picker/line_date_picker.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../ui-extensions/color.dart';

class DateOfAppointment extends StatelessWidget {
  const DateOfAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    // DatePickerController _controller = DatePickerController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        textSubtitle16Blod('เลือกวันที่ต้องการนัดหมาย', color.black87),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/calendar.png',
              scale: 4,
            ),
            const SizedBox(
              width: 10,
            ),
            textBody2('ตุลาคม 2565', color.black87, false),
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              'assets/images/icon_arrow_down.png',
              scale: 4,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: sized.width,
          height: sized.height / 8,
          color: color.white,
          child: DatePicker(
            DateTime.now(),
            daysCount: 30,
            width: 100,
            locale: "th_TH",
            monthTextStyle: TextStyle(
                fontFamily: fontFamily, fontSize: 18, color: color.black87),
            dayTextStyle: TextStyle(
              color: color.black87,
              fontFamily: fontFamily,
              fontSize: 15,
            ),
            dateTextStyle: TextStyle(
              color: color.black87,
              fontFamily: fontFamily,
              fontSize: 18,
            ),
            initialSelectedDate: DateTime.now(),
            selectionColor: ColorTheme().blueText,
            deactivatedColor: ColorTheme().grey10,
            selectedTextColor: color.white,
            onDateChange: (date) {},
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
