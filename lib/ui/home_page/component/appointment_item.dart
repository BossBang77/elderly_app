import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/extension/date_extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({
    required this.appointment,
    this.onTap,
    this.onApply
  });

  final Appointment appointment;
  final Function? onTap;
  final Function? onApply;

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
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
                    textSubtitle1(appointment.eldery.name, ColorTheme().black87),
                    textSubtitle2('${appointment.eldery.gender}, ${appointment.eldery.age} ปี', ColorTheme().greyText, false)
                  ],
                ),
                Spacer(),
                Image.asset('assets/images/appointment_arrow.png', width: 20, height: 20)
              ],
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    textSubtitle2('${appointment.appointmentDate}', ColorTheme().black87, false),
                    Row(
                      children: [
                        Image.asset('assets/images/appointment_clock.png', width: 12, height: 12),
                        SizedBox(width: 6),
                        textSubtitle2('08:00-12:00น.', ColorTheme().black87, false),
                      ],
                    ),
                  ],
                ),
                Spacer(),

                appointment.isAppointmentConfirm() ? 
                Row(
                  children: [
                    Image.asset('assets/images/appointment_check.png', width: 14, height: 14),
                    SizedBox(width: 6),
                    textSubtitle2('เริ่มงาน',ColorTheme().black87, false),
                  ]
                ) :
                GestureDetector(
                  onTap: (){
                    onApply?.call();
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                    decoration: BoxDecoration(
                      color: ColorTheme().blueText,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: textSubtitle2('ยืนยันการนัดหมาย', ColorTheme().white, true),
                  )
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}