import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../ui-extensions/color.dart';

Widget VolunteerInformation(BuildContext context,
    {required String imgPath,
    required String title,
    required String subTitle}) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: color.grey10,
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Image.asset(
            imgPath,
            scale: 4,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textButton1(title, color.black87),
            Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: textButton2(subTitle, color.black87))
          ],
        )
      ],
    ),
  );
}
