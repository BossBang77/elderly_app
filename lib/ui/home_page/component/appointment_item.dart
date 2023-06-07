import 'package:flutter/material.dart';
import 'package:health_application/ui/extension/date_extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({this.onTap});

  final Function? onTap;

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration:  BoxDecoration(
          color: ColorTheme().grey10,
          border: Border.all(color: Colors.black.withAlpha(7)),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/profile_man.png'),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textSubtitle1('นายสมหมาย มงคลจิต', ColorTheme().black87),
                    textSubtitle2('เพศชาย, 78 ปี', ColorTheme().greyText, false)
                  ],
                ),
                Spacer(),
                Image.asset('assets/images/appointment_arrow.png', width: 20, height: 20)
              ],
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textSubtitle2('${DateTime.now().toDisplayFullBuddishDate(locale: 'th')}', ColorTheme().black87, false),
                Row(
                  children: [
                    Image.asset('assets/images/appointment_clock.png', width: 12, height: 12),
                    SizedBox(width: 6),
                    textSubtitle2('08:00-12:00น.', ColorTheme().black87, false),
                    Spacer(),
                    Image.asset('assets/images/appointment_check.png', width: 14, height: 14),
                    SizedBox(width: 6),
                    textSubtitle2('เริ่มงาน',ColorTheme().black87, false)
                  ],
                )
              ],
            )
          ],
        ),
      )
    );
  }
}