import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/appointment/context_menu_button.dart';
import 'package:health_application/ui/elderly/appointment/segmented_control.dart';
import 'package:health_application/ui/home_page/component/appointment_item.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

class AppointmentListView extends StatelessWidget {
  Widget _Header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: SegmentedControl(
            initialValue: 'การนัดหมาย',
            items: ['การนัดหมาย','ประวัติ'].map((value) => 
              SegmentedControlItem(title: value, value: value)
            ).toList(),
          )
        ),
        SizedBox(height: 16),
        ContextMenuButton(
          items: ['ทั้งหมด', 'เริ่มงาน', 'รอเริ่มงาน', 'รอการยืนยัน'].map((value) => ContextMenuItem(value: value, title: value)).toList(),
        ),
      ]
    );
  }

  Widget _ItemList(BuildContext context) {
    return Column(
      children: [
        AppointmentItem(),
        SizedBox(height: 20),
        AppointmentItem(),
      ],
    );
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(onBack: (){}),
      backgroundColor: ColorTheme().white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            _Header(),
            _ItemList(context)
          ],
        )
      ),
    );
  }
}