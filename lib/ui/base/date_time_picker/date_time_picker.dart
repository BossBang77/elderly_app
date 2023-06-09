import 'package:flutter/material.dart';

Future<DateTime> datePicker(BuildContext context,
    {DateTime? initialDate, DateTime? firstDate, DateTime? lastDate}) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: firstDate ?? DateTime(2015),
      lastDate: lastDate ?? DateTime.now().add(Duration(days: 365)));
  return picked ?? DateTime.now();
}

Future<TimeOfDay> timePicker(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  return picked ?? TimeOfDay.now();
}
