import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class MedicationWidget extends StatelessWidget {
  const MedicationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Image.asset(
                  'assets/images/pill.png',
                  scale: 4,
                ),
              ),
              SpaceWidget(
                width: 10,
              ),
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textSubtitle16W500('Furosemide 500mg', color.black87),
                        Image.asset(
                          'assets/images/exit_icon.png',
                          scale: 3,
                        )
                      ],
                    ),
                    textSubtitle2('1 เม็ด', color.black87, false),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textSubtitle2('ก่อนอาหาร', color.black87, false),
                        textSubtitle2('เช้า', color.black87, false),
                        textSubtitle2('9:00 น.', color.black87, false),
                        Container()
                      ],
                    ),
                    textSubtitle15w400('แจ้งเตือนซ้ำๆทุกวัน', color.black87)
                  ],
                ),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
