import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///extension for date
extension DateTimeExtension on DateTime {
  static const String _dateFormat = 'dd-MM-yyyy';
  static const String _dateFormatApi = 'yyyy-MM-dd';
  //// dd/MM/yyy HH:mm  (Hour format 24 hour)
  static const String _dateAndTimeFormat = 'dd/MM/yyyy HH:mm';
  static const String _fullDateFormat = 'd MMMM yyyy';
  static const String _timeFormat = 'HH:mm';

  ///for display date time string [format] with BuddhistDate
  String toDisplayBuddhistDate({String? locale}) {
    try {
      return DateFormat(_dateFormat, locale)
          .format(DateTime.utc(year + 543, month, day))
          .toString();
    } catch (e) {
      return '-';
    }
  }

  String toDisplayThailandDate() {
    try {
      List<String> monthList = [
        'ม.ค.',
        'ก.พ.',
        'มี.ค.',
        'เม.ย.',
        'พ.ค.',
        'มิ.ย.',
        'ก.ค.',
        'ส.ค.',
        'ก.ย.',
        'ต.ค.',
        'พ.ย.',
        'ธ.ค.'
      ];

      return '${day.toString().padLeft(2, '0')} ${monthList[month - 1]} ${year + 543}';
    } catch (e) {
      return '-';
    }
  }

  //// for display date time [BE] to [AD] ---- > Format Api [yyyy-MM-dd]
  String toDisplayChristDateToApi({String? locale}) {
    try {
      return DateFormat(_dateFormatApi, locale)
          .format(DateTime.utc(year - 543, month, day))
          .toString();
    } catch (e) {
      return '-';
    }
  }

  String toDisplayApiFormat({String? locale}) {
    try {
      return DateFormat(_dateFormatApi, locale)
          .format(DateTime.utc(year, month, day))
          .toString();
    } catch (e) {
      return '-';
    }
  }

  String toDisplayDate({String? locale}) {
    try {
      return DateFormat(_dateFormat, locale)
          .format(DateTime.utc(year, month, day))
          .toString();
    } catch (e) {
      return '-';
    }
  }

  String toDisplayTimeOnly({String? locale}) {
    try {
      return DateFormat(_timeFormat, locale)
          .format(DateTime.utc(hour, minute).toLocal())
          .toString();
    } catch (e) {
      return '-';
    }
  }

  String toDisplayTimeOnlyByPicker() {
    try {
      return DateFormat(_timeFormat)
          .format(DateTime.utc(year, month, day, hour, minute).toLocal())
          .toString();
    } catch (e) {
      return '-';
    }
  }

  ///for send it to api
  String toApiFormatDate({String? locale}) {
    try {
      return DateFormat(_dateFormatApi, locale)
          .format(DateTime.utc(year, month, day))
          .toString();
    } catch (e) {
      return '-';
    }
  }

  String toDisplayBuddishDateTime() {
    try {
      return DateFormat(_dateAndTimeFormat)
          .format(DateTime.utc(year + 543, month, day, hour, minute).toLocal())
          .toString();
    } catch (e) {
      return '-';
    }
  }

  String toDisplayFullBuddishDate({String? locale}) {
    try {
      return DateFormat(_fullDateFormat, locale)
          .format(DateTime.utc(year + 543, month, day, hour, minute).toLocal())
          .toString();
    } catch (e) {
      return '-';
    }
  }

  String getMonthThDate() {
    try {
      return DateFormat.yMMM('th')
          .format(DateTime.utc(year + 543, month))
          .toString();
    } catch (e) {
      return '-';
    }
  }
}

DateTime addYears(DateTime startDate, int years) {
  try {
    return DateTime(startDate.year + years, startDate.month, startDate.day);
  } catch (e) {
    return DateTime.now();
  }
}
