import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../ui-extensions/color.dart';

class PeriodWidget extends StatelessWidget {
  const PeriodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textBody1('ช่วงเวลา', color.black87),
        SpaceWidget(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.grey10.withOpacity(0.05),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/before_eat.png',
                    scale: 3,
                  ),
                  textButton1('ก่อนอาหาร', color.black87)
                ],
              ),
            )),
            SpaceWidget(
              width: 5,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.grey10.withOpacity(0.05),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/after_eat.png',
                    scale: 3,
                  ),
                  textButton1('หลังอาหาร', color.black87)
                ],
              ),
            )),
            SpaceWidget(
              width: 5,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: false
                    ? color.grey10.withOpacity(0.05)
                    : color.blueText.withOpacity(0.2),
                border: false ? null : Border.all(color: color.blueText),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/sleepy.png',
                    scale: 3,
                  ),
                  textButton1('ก่อนนอน', color.black87)
                ],
              ),
            )),
          ],
        )
      ],
    );
  }
}
