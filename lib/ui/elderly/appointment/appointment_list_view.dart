import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_bloc.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_event.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_state.dart';
import 'package:health_application/ui/elderly/appointment/context_menu_button.dart';
import 'package:health_application/ui/elderly/appointment/segmented_control.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail.dart';
import 'package:health_application/ui/elderly/appointment_detail/page/appointment_page_approved.dart';
import 'package:health_application/ui/home_page/component/appointment_item.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

class AppointmentListView extends StatelessWidget {
  Widget _Header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: SegmentedControl(
            initialValue: 'การนัดหมาย',
            items: ['การนัดหมาย','ประวัติ'].map((value) => 
              SegmentedControlItem(title: value, value: value)
            ).toList(),
          )
        ),
        SizedBox(height: 16),
        ContextMenuButton(
          items: ['ทั้งหมด', 'เริ่มงาน', 'รอเริ่มงาน', 'รอการยืนยัน'].map((value) => ContextMenuItem(value: value, title: value)).toList(),
        ),
      ]
    );
  }

  Widget _ItemList(BuildContext context, AppointmentListState state) {
    return Column(
      children: state.appointments.map((appointment) => 
        AppointmentItem(
          appointment: appointment,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder:(context) => AppointmentDetailView()));
          },
          onApply: () {
            context.read<AppointmentListBloc>().add(AppointmentApproved(appointmentId: appointment.id));
          },
        )
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
        padding: EdgeInsets.only(left: 16, right: 16),
        child: BlocBuilder<AppointmentListBloc, AppointmentListState>(
          builder: (context, state) => Column(
            children: [
              _Header(),
              _ItemList(context, state)
            ],
          ),
        )
      ),
    );
  }
}