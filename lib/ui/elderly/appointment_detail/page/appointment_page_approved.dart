import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_common_widget.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail_section/appointment_detail_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_name_section/appointment_name_action.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_name_section/appointment_name_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_user_detail_section/appointment_user_detail_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/bloc/appointment_detail_event.dart';
import 'package:health_application/ui/elderly/appointment_detail/bloc/appointment_detail_state.dart';
import 'package:health_application/ui/elderly/appointment_detail/bloc/appointment_detial_bloc.dart';
import 'package:health_application/ui/elderly/appointment_detail/page/appointment_page_state.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmetnPageStateApproved implements AppointmetnPageState<AppointmentDetailApprovedState> {
  const AppointmetnPageStateApproved();

  @override
  Widget body(BuildContext context, AppointmentDetailApprovedState state) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      topSpace(),
      AppointmentStatusSection(appointment: state.appointment),
      separator(),
      AppointmentNameSection(
        actions: [
          AppointmentNameSectionAction.phone((){
            final uri = Uri.parse('tel:${state.appointment.elderly.mobileNumber}');
            launchUrl(uri);
          })
        ], 
        appointment: state.appointment,
      ),
      separator(),
      AppointmentDetailSection(appointment: state.appointment),
      separator(),
      AppointmentUserDetailSection(appointment: state.appointment),


      GestureDetector(
        onTap: () async {
          String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${state.appointment.latitude},${state.appointment.latitude}';
          final uri = Uri.parse(googleUrl);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: Container(
          color: ColorTheme().white,
          padding: EdgeInsets.all(24),
          child: Image.asset('assets/images/location_preview.png', fit: BoxFit.cover,),
        ),
      ),

      Container(
        color: ColorTheme().white,
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            ButtonGradient(
              btnName: status(state),
              onClick: () async {
                print(state.appointment.status);
                if (state.appointment.status == AppointmentStatus.waitingtostart.value) {
                  context.read<AppointmentDetailBloc>().add(AppointmentStatusChanged(status: AppointmentStatus.start.value));
                } else if ((state.appointment.status == AppointmentStatus.start.value)) {
                  context.read<AppointmentDetailBloc>().add(AppointmentStatusChanged(status: AppointmentStatus.complete.value));
                }
              },
            )
          ],
        )
      )
    ],
  );

  String status(AppointmentDetailApprovedState state) {
    if (state.appointment.status == AppointmentStatus.waitingtostart.value) {
      return  'เริ่มงาน';
    }
    if (state.appointment.status == AppointmentStatus.start.value) {
      return 'ให้บริการเรียบร้อยแล้ว';
    }
    return  'เริ่มงาน';
  }
}