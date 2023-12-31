import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_bloc.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_event.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_state.dart';
import 'package:health_application/ui/elderly/appointment/context_menu_button.dart';
import 'package:health_application/ui/elderly/appointment/segmented_control.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail_page.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/page/appointment_page_approved.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/extension/string_extension.dart';
import 'package:health_application/ui/home_page/bloc/home_page_bloc.dart';
import 'package:health_application/ui/home_page/component/appointment_item.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:month_year_picker/month_year_picker.dart';

import '../../base/routes.dart';

class AppointmentListView extends StatelessWidget {
  Future<void> onSelectMonth({
    required BuildContext context,
    required DateTime? currentMonth,
  }) async {
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: currentMonth ?? DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime.now(),
    );
    if (selected != null) {
      DateTime date = DateTime(selected.year, selected.month, 1);
      context
          .read<AppointmentListBloc>()
          .add(SelectFilterMonth(selectDate: date.toApiFormatDate()));
      context
          .read<AppointmentListBloc>()
          .fetchAppointmentList(month: date.toApiFormatDate());
    }
  }

  Widget _Header(BuildContext context, AppointmentListState state) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          child: SegmentedControl<AppointmentListType>(
        initialValue: AppointmentListType.incomplete,
        items: AppointmentListType.values
            .map((type) => SegmentedControlItem(title: type.title, value: type))
            .toList(),
        onSelect: (type) {
          context
              .read<AppointmentListBloc>()
              .add(AppointmentSelectListType(type: type));
        },
      )),
      if (AppointmentListType.completed == state.type)
        Column(
          children: [
            SpaceWidget(
              height: 20,
            ),
            InkWell(
              onTap: () {
                onSelectMonth(
                    context: context,
                    currentMonth: state.currentMonth.parseTime());
              },
              child: Row(
                children: [
                  textSubtitle16Blod(
                    state.currentMonth
                        .parseTime()
                        .toDisplayBuddishMonth(locale: 'th'),
                    color.black87,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/images/icon_arrow_down.png',
                    scale: 4,
                  )
                ],
              ),
            ),
          ],
        ),
      SizedBox(height: 16),
      state.type == AppointmentListType.incomplete
          ? ContextMenuButton<AppointmentTypeFilter>(
              onSelect: (status) {
                context
                    .read<AppointmentListBloc>()
                    .fetchAppointmentList(includeStatus: status.status?.value);
              },
              items: AppointmentTypeFilter.values
                  .map((value) =>
                      ContextMenuItem(value: value, title: value.title))
                  .toList(),
            )
          : Container()
    ]);
  }

  Widget _ItemList(BuildContext context, AppointmentListState state) {
    final list = state.type == AppointmentListType.incomplete
        ? state.appointments
        : state.completedAppointments;
    return Column(
        children: list
            .map((appointment) => Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: AppointmentItem(
                  appointment: appointment,
                  onTap: () {
                    context.push(Routes.appointmentDetail, extra: appointment);
                  },
                  onApply: () {
                    context.read<AppointmentListBloc>().add(
                        AppointmentApproved(appointmentId: appointment.id));
                  },
                )))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(onBack: () {
        context.read<HomePageBloc>().add(ChangeMenu(menus: menuType.mainPage));
      }),
      backgroundColor: ColorTheme().white,
      body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 100),
          child: BlocBuilder<AppointmentListBloc, AppointmentListState>(
            builder: (context, state) => Column(
              children: [_Header(context, state), _ItemList(context, state)],
            ),
          )),
    );
  }
}
