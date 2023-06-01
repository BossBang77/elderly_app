import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

Widget volunteerCard(BuildContext context) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Image.asset(
                    "assets/images/example_volunteer.png",
                  )),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textButton1('นางบุญญาพร สุวรรณโชติ', color.black87),
                textButton2('โรงพยาบาลจุฬาลงกรณ์', color.greyText),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icon_star_point.png',
                        scale: 4,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      textButton2('4.2 (34)', color.greyText),
                      const SizedBox(
                        width: 10,
                      ),
                      VerticalDivider(
                        color: ColorTheme().GreyBackGround,
                        thickness: 1,
                      ),
                      textButton2('5.4 กม. (28 น.)', color.greyText),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      Divider(),
      const SizedBox(
        height: 5,
      ),
    ],
  );
}
