import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_bloc.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_event.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_state.dart';
import 'package:health_application/ui/elderly/appointment/context_menu_button.dart';
import 'package:health_application/ui/elderly/appointment/segmented_control.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail_page.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/page/appointment_page_approved.dart';
import 'package:health_application/ui/home_page/component/appointment_item.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

class AppointmentListView extends StatelessWidget {
  Widget _Header(BuildContext context, AppointmentListState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: SegmentedControl<AppointmentListType>(
            initialValue: AppointmentListType.incomplete,
            items: AppointmentListType.values.map((type) => 
              SegmentedControlItem(title: type.title, value: type)
            ).toList(),
            onSelect: (type) {
              context.read<AppointmentListBloc>().add(AppointmentSelectListType(type: type));
            },
          )
        ),
        SizedBox(height: 16),
        state.type == AppointmentListType.incomplete ?
        ContextMenuButton<AppointmentTypeFilter>(
          onSelect: (status) {
            context.read<AppointmentListBloc>().fetchAppointmentList(includeStatus: status.status?.value);
          },
          items: AppointmentTypeFilter.values.map((value) => ContextMenuItem(value: value, title: value.title)).toList(),
        ) : Container()
      ]
    );
  }

  Widget _ItemList(BuildContext context, AppointmentListState state) {
    final list = state.type == AppointmentListType.incomplete ? state.appointments : state.completedAppointments;
    return Column(
      children: list.map((appointment) => 
        Padding(
          padding: EdgeInsets.only(bottom: 10),
            child: AppointmentItem(
              appointment: appointment,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder:(context) => AppointmentDetailPage(appointment: appointment,)));
              },
              onApply: () {
                context.read<AppointmentListBloc>().add(AppointmentApproved(appointmentId: appointment.id));
              },
            ))
      ).toList()
    );
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(onBack: (){
        Navigator.of(context).pop();
      }),
      backgroundColor: ColorTheme().white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 100),
        child: BlocBuilder<AppointmentListBloc, AppointmentListState>(
          builder: (context, state) => Column(
            children: [
              _Header(context, state),
              _ItemList(context, state)
            ],
          ),
        )
      ),
    );
  }
}