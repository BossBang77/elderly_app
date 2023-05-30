import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class RecentlySearched extends StatelessWidget {
  const RecentlySearched({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO recive list
    var listexample = [
      'เดิน',
      'กายบริหาร',
      'ว่ายน้ำ',
      'วิ่งช้าๆ',
      'ปั่นจักรยาน'
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textSubtitle18Blod('รายการที่ค้นหาล่าสุด', ColorTheme().black87),
        Wrap(
          children: [
            for (var item in listexample)
              Container(
                  margin: EdgeInsets.only(top: 10, right: 10),
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  decoration: BoxDecoration(
                      color: color.grey10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: color.GreyBorder)),
                  child: textSubtitle16Blod(item, color.BlueDark))
          ],
        )
      ],
    );
  }
}
