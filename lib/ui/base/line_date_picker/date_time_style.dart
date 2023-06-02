import 'package:flutter/material.dart';

const TextStyle defaultMonthTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
);

const TextStyle defaultDateTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
);

const TextStyle defaultDayTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
);

/// Signature for a function that detects when a tap is occurred.
///
/// Used by [DatePickerTimeline] for tap detection.
typedef DateSelectionCallback = void Function(DateTime selectedDate);

/// Signature for a function that is called when selected date is changed
///
/// Used by [DatePickerTimeline] for tap detection.
typedef DateChangeListener = void Function(DateTime selectedDate);
