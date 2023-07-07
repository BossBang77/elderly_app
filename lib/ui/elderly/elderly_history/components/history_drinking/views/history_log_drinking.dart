import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/base/custom_calendar_date/custom_calendar_date_config.dart';
import 'package:health_application/ui/base/custom_calendar_date/custom_calendar_date_picker.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_drinking/bloc/history_drinking_bloc.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_drinking/model/mock_drinking_data.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_drinking/views/history_drinking_box.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class HistoryLogDrinking extends StatelessWidget {
  const HistoryLogDrinking({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime firstDate = DateTime(1990);
    final DateTime lastDate = DateTime.now();
    TextStyle textCalendar(Color color) {
      return TextStyle(
          color: color,
          fontSize: 15.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w300);
    }

    CustomCalendarDatePickerConfig _buildDateCalendarConfig() {
      return CustomCalendarDatePickerConfig(
        yearFormat: CustomYearFormat.th,
        weekdayLabels: null,
        calendarType: CustomCalendarDatePickerType.multi,
        firstDate: firstDate,
        lastDate: lastDate,
        currentDate: DateTime.now(),
        calendarViewMode: DatePickerMode.day,
        holidayTextStyle: textCalendar(color.white),
        holidayHighLightColor: color.Primary,
        selectedDayTextStyle: textCalendar(color.white),
        selectedDayHighlightColor: color.Primary,
        todayTextStyle: textCalendar(color.Primary),
        toDayHighlightColor: color.white,
        weekdayLabelTextStyle: textCalendar(color.black87),
        dayTextStyle: textCalendar(color.black87),
        yearTextStyle: textCalendar(color.black87),
        controlsTextStyle: textCalendar(color.black87),
        defaultTextStyle: textCalendar(color.black87),
      );
    }

    return BlocConsumer<HistoryDrinkingBloc, HistoryDrinkingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: color.grey10),
                color: color.white,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: CustomCalendarDatePicker(
                holidayValue: [],
                initialSelectDate: state.selectedDate.isNotEmpty
                    ? DateTime.parse(state.selectedDate)
                    : DateTime.now(),
                config: _buildDateCalendarConfig(),
                enableClickOnlyHoliday: false,
                selectedDayChange: (value) {
                  var date = value.toApiFormatDate();
                  context
                      .read<HistoryDrinkingBloc>()
                      .add(OnSelectDateChange(date: date));
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            textSubtitle18W800(
                state.selectedDate.isNotEmpty
                    ? DateTime.parse(state.selectedDate)
                        .toDisplayFullBuddishDate(locale: 'th')
                    : DateTime.now().toDisplayFullBuddishDate(locale: 'th'),
                color.black87),
            const SizedBox(
              height: 20,
            ),
            HistoryDrinkingBox(
              waters: state.drinkingLogData,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        );
      },
    );
  }
}
