import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/line_date_picker/line_date_picker.dart';
import 'package:health_application/ui/base/widget/title_header.dart';
import 'package:health_application/ui/elderly/search_volunteer/bloc/search_volunteer_bloc.dart';
import 'package:health_application/ui/extension/date_extension.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:http/http.dart';
import 'package:month_year_picker/month_year_picker.dart';

import '../../../ui-extensions/color.dart';

class DateOfAppointment extends StatelessWidget {
  const DateOfAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;

    return BlocBuilder<SearchVolunteerBloc, SearchVolunteerState>(
      builder: (context, state) {
        int getDate(DateTime start) {
          DateTime lastDayCurrentMonth =
              DateTime.utc(start.year, start.month + 1)
                  .subtract(Duration(days: 1));

          return lastDayCurrentMonth.day - (start.day - 1);
        }

        Future<void> _onSelectMonth({
          required BuildContext context,
        }) async {
          final selected = await showMonthYearPicker(
            context: context,
            initialDate: state.currentMonth ?? DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year + 1),
          );
          if (selected != null) {
            DateTime date = DateTime(selected.year, selected.month, 1);
            context
                .read<SearchVolunteerBloc>()
                .add(UpdateSelectMonth(date: date));
          }
        }

        var currentMonth = state.currentMonth ?? DateTime.now();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            TitleHeaderWidget(
              title: 'เลือกวันที่ต้องการนัดหมาย',
              isMandatory: true,
            ),
            textH7('กรุณาเลือกวันที่ต้องการนัดหมาย', color.Error),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                _onSelectMonth(context: context);
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/calendar.png',
                    scale: 4,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  textBody2(currentMonth.toDisplayBuddishMonth(locale: 'th'),
                      color.black87, false),
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
            const SizedBox(
              height: 20,
            ),
            Container(
              width: sized.width,
              height: sized.height / 8,
              color: color.white,
              child: DatePicker(
                state.currentMonth?.month == DateTime.now().month
                    ? DateTime.now()
                    : state.currentMonth ?? DateTime.now(),
                daysCount: state.createAppointment.getDateAppointment().month ==
                        DateTime.now().month
                    ? getDate(DateTime.now())
                    : getDate(state.currentMonth ?? DateTime.now()),
                width: 100,
                locale: "th_TH",
                monthTextStyle: TextStyle(
                    fontFamily: fontFamily, fontSize: 18, color: color.black87),
                dayTextStyle: TextStyle(
                  color: color.black87,
                  fontFamily: fontFamily,
                  fontSize: 15,
                ),
                dateTextStyle: TextStyle(
                  color: color.black87,
                  fontFamily: fontFamily,
                  fontSize: 18,
                ),
                initialSelectedDate: DateTime.now(),
                selectionColor: ColorTheme().blueText,
                deactivatedColor: ColorTheme().grey10,
                selectedTextColor: color.white,
                onDateChange: (date) {
                  context.read<SearchVolunteerBloc>().add(MapCreateAppointment(
                      createObj: CreateAppointObj.appointmentDate,
                      value: date.toDisplayApiFormat()));

                  context.read<SearchVolunteerBloc>().add(MapCreateAppointment(
                        createObj: CreateAppointObj.clearTime,
                      ));

                  context
                      .read<SearchVolunteerBloc>()
                      .add(GetAvaliableTime(date: date));
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
