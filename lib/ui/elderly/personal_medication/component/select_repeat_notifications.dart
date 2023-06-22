import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../base/widget/space_widget.dart';
import '../../../base/widget/switch_toggle.dart';
import '../../../ui-extensions/color.dart';

class SelectRepeatNotifications extends StatelessWidget {
  const SelectRepeatNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textBody1('แจ้งเตือนซ้ำทุกๆ วัน', color.black87),
            SpaceWidget(
              height: 10,
            ),
            textSubtitle15w400(
                'ช่วยเตือนการรับประทานยาให้ถูกต้อง\nและตรงเวลา ตามแพทย์สั่ง',
                color.black87,
                maxLine: 2)
          ],
        ),
        SwitchToggle(value: true, onChange: (value) {}),
      ],
    );
  }
}
