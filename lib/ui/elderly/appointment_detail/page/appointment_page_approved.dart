import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_common_widget.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail_section/appointment_detail_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_name_section/appointment_name_action.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_name_section/appointment_name_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_user_detail_section/appointment_user_detail_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/page/appointment_page_state.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

class AppointmetnPageStateApproved implements AppointmetnPageState {
  const AppointmetnPageStateApproved();

  @override
  Widget body(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      topSpace(),
      AppointmentStatusSection(),
      separator(),
      AppointmentNameSection(
        actions: [
          AppointmentNameSectionAction.phone((){})
        ],
      ),
      separator(),
      AppointmentDetailSection(),
      separator(),
      AppointmentUserDetailSection(),

      Container(
        color: ColorTheme().white,
        padding: EdgeInsets.all(24),
        child: Image.asset('assets/images/location_preview.png', fit: BoxFit.cover,),
      ),

      Container(
        color: ColorTheme().white,
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            ButtonGradient(
              btnName: 'เริ่มงาน',
              onClick: () async {
              },
            )
          ],
        )
      )
    ],
  );
}