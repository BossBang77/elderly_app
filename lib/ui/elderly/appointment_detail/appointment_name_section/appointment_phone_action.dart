import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_name_section/appointment_name_action.dart';

class PhoneAction extends AppointmentNameSectionAction {
  const PhoneAction({
    this.action
  }) : super(title: '', image: '');

  @override
  final String title = 'โทร';

  @override 
  final String image = 'assets/images/phone_blue.png';

  @override
  final Function? action;
}