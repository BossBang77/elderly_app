import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/appointment_detail/page/appointment_page_approved.dart';
import 'package:health_application/ui/elderly/appointment_detail/page/appointment_page_history.dart';
import 'package:health_application/ui/elderly/appointment_detail/page/appointment_page_waitforapprove.dart';
import 'package:health_application/ui/elderly/appointment_detail/widget_provider.dart';

abstract class AppointmetnPageState implements WidgetProvider {
  const AppointmetnPageState();
  
  Widget body(BuildContext context);

  static get waitforapprove => AppointmetnPageStateWaitForApprove();
  static get approved => AppointmetnPageStateApproved();
  static get history => AppointmetnPageStateHistory();
}