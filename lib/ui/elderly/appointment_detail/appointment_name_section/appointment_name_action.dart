import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_name_section/appointment_phone_action.dart';
import 'package:health_application/ui/elderly/appointment_detail/widget_provider.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

abstract class AppointmentNameSectionAction implements WidgetProvider {
  const AppointmentNameSectionAction({
    required this.title,
    required this.image,
    this.action
  });

  final Function? action;
  final String title;
  final String image;

  Widget body(BuildContext context) {
    return ActionWidget(image: image, title: title, action: action);
  }

  static AppointmentNameSectionAction phone(Function? action) => PhoneAction(action: action);
}

Widget ActionWidget({
  required String title,
  required String image,
  Function? action
}) => GestureDetector(
  onTap: () {
    action?.call();
  },
  child: Container(
    padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
    decoration: BoxDecoration(
      color: ColorTheme().BlueFade2.withAlpha(25),
      borderRadius: BorderRadius.circular(17)
    ),
    child: Row(
      children: [
        Image.asset(image, width: 14, height: 14),
        SizedBox(width: 8),
        textH7(title, ColorTheme().blueText)
      ],
    ),
  )
);