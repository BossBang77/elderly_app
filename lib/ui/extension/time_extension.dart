import 'package:flutter/material.dart';

///extension for time
extension TimeExtension on TimeOfDay {
  ///for display  time string [format]
  String toDisplayTime() {
    return '${this.hour}:${this.minute}';
  }

  String toAPIFormatTime() {
    return '${this.hour}:${this.minute}:00';
  }

  String toTimeFormat() {
    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
  }
}
