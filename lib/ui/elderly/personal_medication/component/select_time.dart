import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../base/widget/dropdown_widget.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({super.key});

  @override
  Widget build(BuildContext context) {
    final listEx = ['เช้า', 'กลางวัน', 'เย็น', 'อื่นๆ']; // TODO
    return Column(
      children: [
        for (int i = 0; i < 4; i++)
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(5),
                decoration: StyleBorder().greyDecoration(radius: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(minHeight: 50),
                      child: Image.asset(
                        i == 0
                            ? 'assets/images/check_box_check.png'
                            : 'assets/images/check_box_uncheck.png',
                        scale: 4,
                      ),
                    ),
                    SpaceWidget(
                      width: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: textH7(
                        listEx[i],
                        color.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SpaceWidget(
                height: 20,
              ),
              if (i == 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textSubtitle16Blod('เวลาแจ้งเตือน', color.black87),
                    DropdownWidget(
                      items: ['15.00 น.'],
                      onChanged: (value) {},
                      hint: 'ระบุเวลาแจ้งเตือน',
                    ),
                    SpaceWidget(
                      height: 20,
                    ),
                  ],
                ),
            ],
          )
      ],
    );
  }
}
