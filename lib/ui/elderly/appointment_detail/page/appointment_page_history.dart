import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/button_blue_fade.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/elderly/appointment_detail/dialog/appointment_approve_dialog.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_common_widget.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail_section/appointment_detail_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_history_status_section/appointment_history_status.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_history_status_section/appointment_history_status_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_name_section/appointment_name_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_user_detail_section/appointment_user_detail_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/page/appointment_page_state.dart';

class AppointmetnPageStateHistory implements AppointmetnPageState {
  const AppointmetnPageStateHistory();
  @override
  Widget body(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      topSpace(),
      AppointmentHistoryStatusSection(status: AppointmentHistoryStatus.completed),
      separator(),
      AppointmentNameSection(),
      separator(),
      AppointmentDetailSection(),
      separator(),
      AppointmentUserDetailSection(),
    ],
  );
}