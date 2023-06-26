import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';
import 'package:health_application/ui/extension/date_extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:intl/intl.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({required this.appointment, this.onTap, this.onApply});

  final Appointment appointment;
  final Function? onTap;
  final Function? onApply;

  String statusImage(Appointment appointment) {
    if (appointment.status == AppointmentStatus.reject.value) {
      return 'assets/images/appointment_calceled.png';
    }
    return 'assets/images/appointment_check.png';
  }

  String time(Appointment appointment) {
    if (appointment.appointmentTimes.length >= 1) {
      return appointment.appointmentTimes.first.name;
    }
    return '';
  }

  String date(Appointment appointment) {
    if (appointment.appointmentDate.isEmpty) {
      return '-';
    }
    DateTime dateTime = DateTime.parse(appointment.appointmentDate);
    return dateTime.toDisplayThailandDate();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          decoration: BoxDecoration(
              color: ColorTheme().appointmentCardBackground,
              border: Border.all(color: Colors.black.withAlpha(7)),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(appointment.genderToImagePath(),
                      height: 48, width: 48),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textSubtitle1(
                          appointment.elderly.name, ColorTheme().black87),
                      textSubtitle2(
                          '${appointment.genderToDisplayFormat()}, อายุ ${appointment.elderly.age} ปี',
                          ColorTheme().greyText,
                          false)
                    ],
                  ),
                  Spacer(),
                  Image.asset('assets/images/appointment_arrow.png',
                      width: 20, height: 20)
                ],
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textSubtitle2(
                          date(appointment), ColorTheme().black87, false),
                      Row(
                        children: [
                          Image.asset('assets/images/appointment_clock.png',
                              width: 12, height: 12),
                          SizedBox(width: 6),
                          textSubtitle2(
                              time(appointment), ColorTheme().black87, false),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  appointment.isAppointmentConfirm()
                      ? Row(children: [
                          Image.asset(statusImage(appointment),
                              width: 14, height: 14),
                          SizedBox(width: 6),
                          textSubtitle2(
                              AppointmentStatus.fromString(appointment.status)
                                      ?.title ??
                                  AppointmentStatus.waitingtostart.title,
                              ColorTheme().black87,
                              false),
                        ])
                      : GestureDetector(
                          onTap: () {
                            onApply?.call();
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 8),
                            padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                            decoration: BoxDecoration(
                                color: ColorTheme().blueText,
                                borderRadius: BorderRadius.circular(6)),
                            child: textSubtitle2(
                                'ยืนยันการนัดหมาย', ColorTheme().white, true),
                          ))
                ],
              ),
            ],
          ),
        ));
  }
}
