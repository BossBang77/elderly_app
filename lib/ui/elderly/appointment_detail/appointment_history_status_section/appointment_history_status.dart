import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

abstract class AppointmentHistoryStatus {
  const AppointmentHistoryStatus({
    required this.title,
    required this.image,
    required this.color
  });

  final String title;
  final String image;
  final Color color;
  
  static var completed = AppointmentHistoryStatusCompleted();
  static var canceled = AppointmentHistoryStatusCanceled();

  static AppointmentHistoryStatus fromString(String status) {
    if (status == AppointmentStatus.complete.value) {
      return completed;
    }
    if (status == AppointmentStatus.reject.value) {
      return canceled;
    }
    return completed;
  }
} 

class AppointmentHistoryStatusCompleted implements AppointmentHistoryStatus {
  final String title = 'สำเร็จ';
  final String image = 'assets/images/appointment_check.png';
  final Color color = ColorTheme().blueText; 
}

class AppointmentHistoryStatusCanceled implements AppointmentHistoryStatus {
  final String title = 'ยกเลิก';
  final String image = 'assets/images/appointment_calceled.png';
  final Color color = ColorTheme().DarkRed; 
}