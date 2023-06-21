import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/volunteer/request_assistance_detail/request_assitance_detail_page.dart';

import '../../../ui-extensions/color.dart';
import '../../../volunteer/request_assistance_detail/model/assitance_model.dart';

class VolunteerAcceptAssistance extends StatelessWidget {
  const VolunteerAcceptAssistance({
    super.key,
    required this.item,
  });
  final AssitanceDetailModel item;

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    var assistance = item;
    var profile = item.profile;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RequestAssitanceDetailPage(
                    assistanceId: item.id,
                  )),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color.DarkRed.withOpacity(0.12),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: color.DarkRed)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/silane_red.png',
                  scale: 4,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textSubtitle16Blod(
                        'กำลังให้ความช่วยเหลือ...', color.redText),
                    textBody2(profile.name, color.redText, false),
                    Container(
                        width: sized.width * 0.6,
                        child: textBody2(
                          assistance.addressFull,
                          color.redText,
                          false,
                        ))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
