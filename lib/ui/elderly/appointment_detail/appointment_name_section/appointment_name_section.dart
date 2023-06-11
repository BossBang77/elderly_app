import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_name_section/appointment_name_action.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AppointmentNameSection extends StatelessWidget {
  const AppointmentNameSection({this.actions = const[]});

  final List<AppointmentNameSectionAction> actions;

  @override 
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24),
          color: ColorTheme().white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textSubtitle1('ผู้นัดหมาย', ColorTheme().black87),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/profile_woman.png', width: 56, height: 56),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textSubtitle1('นางสมร มงคลจิต', ColorTheme().black87),
                      textSubtitle2('เพศหญิง, 78 ปี', ColorTheme().grey50, false),
                      SizedBox(height: 12),
                      Row(
                        children: actions.map((action) => action.body(context)).toList()
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ]
    );
  }
}

