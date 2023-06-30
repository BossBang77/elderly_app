import 'package:flutter/material.dart';

enum CustomCalendarDatePickerType { single, multi, range }

enum CustomYearFormat { th, en }

class CustomCalendarDatePickerConfig {
  CustomCalendarDatePickerConfig({
    CustomCalendarDatePickerType? calendarType,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerMode? calendarViewMode,
    CustomYearFormat? yearFormat,
    this.weekdayLabels,
    this.weekdayLabelTextStyle,
    this.controlsHeight,
    this.lastMonthIcon,
    this.nextMonthIcon,
    this.controlsTextStyle,
    this.dayTextStyle,
    this.selectedDayTextStyle,
    this.selectedDayHighlightColor,
    this.holidayTextStyle,
    this.holidayHighLightColor,
    this.disabledDayTextStyle,
    this.todayTextStyle,
    this.toDayHighlightColor,
    this.yearTextStyle,
    this.defaultTextStyle,
    this.dayBorderRadius,
    this.yearBorderRadius,
  })  : calendarType = calendarType ?? CustomCalendarDatePickerType.single,
        firstDate = firstDate ?? DateTime(1970),
        yearFormat = yearFormat ?? CustomYearFormat.en,
        lastDate = lastDate ?? DateTime(DateTime.now().year + 50),
        currentDate = currentDate ?? DateUtils.dateOnly(DateTime.now()),
        calendarViewMode = calendarViewMode ?? DatePickerMode.day;

  /// The enabled date picker mode
  final CustomCalendarDatePickerType calendarType;

  /// note: set to display buddhist year or christ year only value will return christ format
  final CustomYearFormat? yearFormat;

  /// The earliest allowable [DateTime] that the user can select.
  final DateTime firstDate;

  /// The latest allowable [DateTime] that the user can select.
  final DateTime lastDate;

  /// The [DateTime] representing today. It will be highlighted in the day grid.
  final DateTime currentDate;

  /// The initially displayed view of the calendar picker.
  final DatePickerMode calendarViewMode;

  /// Custom weekday labels for the current locale
  final List<String>? weekdayLabels;

  /// Custom text style for weekday labels
  final TextStyle? weekdayLabelTextStyle;

  /// Custom height for calendar control toggle's height
  final double? controlsHeight;

  /// Custom icon for last month button control
  final Widget? lastMonthIcon;

  /// Custom icon for next month button control
  final Widget? nextMonthIcon;

  /// Custom text style for calendar mode toggle control
  final TextStyle? controlsTextStyle;

  /// Custom text style for calendar day text
  final TextStyle? dayTextStyle;

  /// Custom text style for selected calendar day(s)
  final TextStyle? selectedDayTextStyle;

  /// The highlight color for selected day
  final Color? selectedDayHighlightColor;

  /// Custom text style for holiday calendar day(s)
  final TextStyle? holidayTextStyle;

  /// The highlight color for holiday day
  final Color? holidayHighLightColor;

  /// Custom text style for disabled calendar day(s)
  final TextStyle? disabledDayTextStyle;

  /// Custom text style for the current day
  final TextStyle? todayTextStyle;

  /// The highlight color for current day
  final Color? toDayHighlightColor;

  // Custom text style for years list
  final TextStyle? yearTextStyle;

  // Custom text style for default
  final TextStyle? defaultTextStyle;

  /// Custom border radius for day indicator
  final BorderRadius? dayBorderRadius;

  /// Custom border radius for year indicator
  final BorderRadius? yearBorderRadius;

  CustomCalendarDatePickerConfig copyWith({
    CustomCalendarDatePickerType? calendarType,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerMode? calendarViewMode,
    CustomYearFormat? yearFormat,
    List<String>? weekdayLabels,
    TextStyle? weekdayLabelTextStyle,
    double? controlsHeight,
    Widget? lastMonthIcon,
    Widget? nextMonthIcon,
    TextStyle? controlsTextStyle,
    TextStyle? dayTextStyle,
    TextStyle? selectedDayTextStyle,
    Color? selectedDayHighlightColor,
    TextStyle? holidayTextStyle,
    Color? holidayHighLightColor,
    TextStyle? disabledDayTextStyle,
    TextStyle? todayTextStyle,
    TextStyle? yearTextStyle,
    TextStyle? defaultTextStyle,
    BorderRadius? dayBorderRadius,
    BorderRadius? yearBorderRadius,
  }) {
    return CustomCalendarDatePickerConfig(
      calendarType: calendarType ?? this.calendarType,
      firstDate: firstDate ?? this.firstDate,
      lastDate: lastDate ?? this.lastDate,
      currentDate: currentDate ?? this.currentDate,
      calendarViewMode: calendarViewMode ?? this.calendarViewMode,
      yearFormat: yearFormat ?? this.yearFormat,
      weekdayLabels: weekdayLabels ?? this.weekdayLabels,
      weekdayLabelTextStyle:
          weekdayLabelTextStyle ?? this.weekdayLabelTextStyle,
      controlsHeight: controlsHeight ?? this.controlsHeight,
      lastMonthIcon: lastMonthIcon ?? this.lastMonthIcon,
      nextMonthIcon: nextMonthIcon ?? this.nextMonthIcon,
      controlsTextStyle: controlsTextStyle ?? this.controlsTextStyle,
      dayTextStyle: dayTextStyle ?? this.dayTextStyle,
      selectedDayTextStyle: selectedDayTextStyle ?? this.selectedDayTextStyle,
      selectedDayHighlightColor:
          selectedDayHighlightColor ?? this.selectedDayHighlightColor,
      holidayTextStyle: holidayTextStyle ?? this.holidayTextStyle,
      holidayHighLightColor:
          holidayHighLightColor ?? this.holidayHighLightColor,
      disabledDayTextStyle: disabledDayTextStyle ?? this.disabledDayTextStyle,
      todayTextStyle: todayTextStyle ?? this.todayTextStyle,
      yearTextStyle: yearTextStyle ?? this.yearTextStyle,
      defaultTextStyle: defaultTextStyle ?? this.defaultTextStyle,
      dayBorderRadius: dayBorderRadius ?? this.dayBorderRadius,
      yearBorderRadius: yearBorderRadius ?? this.yearBorderRadius,
    );
  }
}

class CustomCalendarDatePickerWithActionButtonsConfig
    extends CustomCalendarDatePickerConfig {
  CustomCalendarDatePickerWithActionButtonsConfig({
    CustomCalendarDatePickerType? calendarType,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerMode? calendarViewMode,
    CustomYearFormat? yearFormat,
    List<String>? weekdayLabels,
    TextStyle? weekdayLabelTextStyle,
    double? controlsHeight,
    Widget? lastMonthIcon,
    Widget? nextMonthIcon,
    TextStyle? controlsTextStyle,
    TextStyle? dayTextStyle,
    TextStyle? selectedDayTextStyle,
    Color? selectedDayHighlightColor,
    TextStyle? holidayTextStyle,
    Color? holidayHighLightColor,
    TextStyle? disabledDayTextStyle,
    TextStyle? todayTextStyle,
    Color? toDayHighlightColor,
    TextStyle? yearTextStyle,
    TextStyle? defaultTextStyle,
    BorderRadius? dayBorderRadius,
    BorderRadius? yearBorderRadius,
    this.gapBetweenCalendarAndButtons,
    this.cancelButtonTextStyle,
    this.cancelButton,
    this.okButtonTextStyle,
    this.okButton,
    this.openedFromDialog,
    this.shouldCloseDialogAfterCancelTapped,
  }) : super(
          calendarType: calendarType,
          firstDate: firstDate,
          lastDate: lastDate,
          currentDate: currentDate,
          calendarViewMode: calendarViewMode,
          yearFormat: yearFormat,
          weekdayLabels: weekdayLabels,
          weekdayLabelTextStyle: weekdayLabelTextStyle,
          controlsHeight: controlsHeight,
          lastMonthIcon: lastMonthIcon,
          nextMonthIcon: nextMonthIcon,
          controlsTextStyle: controlsTextStyle,
          dayTextStyle: dayTextStyle,
          selectedDayTextStyle: selectedDayTextStyle,
          selectedDayHighlightColor: selectedDayHighlightColor,
          holidayTextStyle: holidayTextStyle,
          holidayHighLightColor: holidayHighLightColor,
          disabledDayTextStyle: disabledDayTextStyle,
          todayTextStyle: todayTextStyle,
          toDayHighlightColor: toDayHighlightColor,
          yearTextStyle: yearTextStyle,
          defaultTextStyle: defaultTextStyle,
          dayBorderRadius: dayBorderRadius,
          yearBorderRadius: yearBorderRadius,
        );

  /// The gap between calendar and action buttons
  final double? gapBetweenCalendarAndButtons;

  /// Text style for cancel button
  final TextStyle? cancelButtonTextStyle;

  /// Custom cancel button
  final Widget? cancelButton;

  /// Text style for ok button
  final TextStyle? okButtonTextStyle;

  /// Custom ok button
  final Widget? okButton;

  /// Is the calendar opened from dialog
  final bool? openedFromDialog;

  /// If the dialog should be closed when user taps the cancel button
  final bool? shouldCloseDialogAfterCancelTapped;

  @override
  CustomCalendarDatePickerWithActionButtonsConfig copyWith({
    CustomCalendarDatePickerType? calendarType,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerMode? calendarViewMode,
    CustomYearFormat? yearFormat,
    List<String>? weekdayLabels,
    TextStyle? weekdayLabelTextStyle,
    double? controlsHeight,
    Widget? lastMonthIcon,
    Widget? nextMonthIcon,
    TextStyle? controlsTextStyle,
    TextStyle? dayTextStyle,
    TextStyle? selectedDayTextStyle,
    Color? selectedDayHighlightColor,
    TextStyle? holidayTextStyle,
    Color? holidayHighLightColor,
    TextStyle? disabledDayTextStyle,
    TextStyle? todayTextStyle,
    Color? toDayHighlightColor,
    TextStyle? yearTextStyle,
    TextStyle? defaultTextStyle,
    double? gapBetweenCalendarAndButtons,
    TextStyle? cancelButtonTextStyle,
    Widget? cancelButton,
    TextStyle? okButtonTextStyle,
    Widget? okButton,
    bool? openedFromDialog,
    bool? shouldCloseDialogAfterCancelTapped,
    BorderRadius? dayBorderRadius,
    BorderRadius? yearBorderRadius,
  }) {
    return CustomCalendarDatePickerWithActionButtonsConfig(
      calendarType: calendarType ?? this.calendarType,
      firstDate: firstDate ?? this.firstDate,
      lastDate: lastDate ?? this.lastDate,
      currentDate: currentDate ?? this.currentDate,
      calendarViewMode: calendarViewMode ?? this.calendarViewMode,
      yearFormat: yearFormat ?? this.yearFormat,
      weekdayLabels: weekdayLabels ?? this.weekdayLabels,
      weekdayLabelTextStyle:
          weekdayLabelTextStyle ?? this.weekdayLabelTextStyle,
      controlsHeight: controlsHeight ?? this.controlsHeight,
      lastMonthIcon: lastMonthIcon ?? this.lastMonthIcon,
      nextMonthIcon: nextMonthIcon ?? this.nextMonthIcon,
      controlsTextStyle: controlsTextStyle ?? this.controlsTextStyle,
      dayTextStyle: dayTextStyle ?? this.dayTextStyle,
      selectedDayTextStyle: selectedDayTextStyle ?? this.selectedDayTextStyle,
      selectedDayHighlightColor:
          selectedDayHighlightColor ?? this.selectedDayHighlightColor,
      holidayTextStyle: holidayTextStyle ?? this.holidayTextStyle,
      holidayHighLightColor:
          holidayHighLightColor ?? this.holidayHighLightColor,
      disabledDayTextStyle: disabledDayTextStyle ?? this.disabledDayTextStyle,
      todayTextStyle: todayTextStyle ?? this.todayTextStyle,
      toDayHighlightColor: toDayHighlightColor ?? this.toDayHighlightColor,
      yearTextStyle: yearTextStyle ?? this.yearTextStyle,
      defaultTextStyle: defaultTextStyle ?? this.defaultTextStyle,
      gapBetweenCalendarAndButtons:
          gapBetweenCalendarAndButtons ?? this.gapBetweenCalendarAndButtons,
      cancelButtonTextStyle:
          cancelButtonTextStyle ?? this.cancelButtonTextStyle,
      cancelButton: cancelButton ?? this.cancelButton,
      okButtonTextStyle: okButtonTextStyle ?? this.okButtonTextStyle,
      okButton: okButton ?? this.okButton,
      openedFromDialog: openedFromDialog ?? this.openedFromDialog,
      shouldCloseDialogAfterCancelTapped: shouldCloseDialogAfterCancelTapped ??
          this.shouldCloseDialogAfterCancelTapped,
      dayBorderRadius: dayBorderRadius ?? this.dayBorderRadius,
      yearBorderRadius: yearBorderRadius ?? this.yearBorderRadius,
    );
  }
}
