import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class CardListMenu extends StatelessWidget {
  const CardListMenu(
      {super.key,
      required this.title,
      required this.img,
      this.sufficTxt = '',
      required this.onClick});
  final String title;
  final String img;
  final String sufficTxt;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        decoration: StyleBorder().greyDecoration(radius: 10),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  img,
                  scale: 4,
                ),
                const SizedBox(
                  width: 10,
                ),
                textButton1(title, color.black87),
              ],
            ),
            Row(
              children: [
                textButton1(sufficTxt, color.Error),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
