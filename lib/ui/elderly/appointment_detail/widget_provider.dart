import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/appointment_detail/bloc/appointment_detail_state.dart';

abstract class WidgetProvider {
  Widget body(BuildContext context);
}

abstract class AppointmentDetailWidgetProvider<State extends AppointmentDetailState> {
  Widget body(BuildContext context, State state);
}