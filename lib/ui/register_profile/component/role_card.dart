import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

Widget roleCard(BuildContext context,
    {String title = '',
    String subTitle = '',
    String imgPath = '',
    bool isSelect = false,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: isSelect ? Border.all(color: ColorTheme().Primary) : null,
          color: isSelect ? ColorTheme().BlueBackGround : ColorTheme().grey10),
      child: Row(
        children: [
          Image.asset(
            imgPath,
            scale: 4,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textSubtitle16Blod(title, ColorTheme().black87),
              textH7(subTitle, ColorTheme().black87),
            ],
          )
        ],
      ),
    ),
  );
}
