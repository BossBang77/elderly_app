import 'package:flutter/material.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

Widget carddetail(
    {required String img, required String title, required String detail}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Image.asset(
              img,
              scale: 3,
              color: color.DartBlue,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textButton1(title, color.greyText),
              textButton1(detail, color.black87, maxLines: 10),
            ],
          ),
        )
      ],
    ),
  );
}

Widget sectionExpand(
    {required String img,
    required String title,
    required bool isExpand,
    required VoidCallback onClick,
    Widget child = const SizedBox()}) {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
    decoration: StyleBorder().greyDecoration(isBorder: false, radius: 15),
    child: Column(
      children: [
        InkWell(
          onTap: () {
            onClick();
          },
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
                    width: 20,
                  ),
                  textSubtitle16Blod(title, color.black87),
                ],
              ),
              Image.asset(
                isExpand
                    ? 'assets/images/arrow_up.png'
                    : 'assets/images/arrow_down.png',
                scale: 4,
              )
            ],
          ),
        ),
        if (isExpand)
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Divider(),
              const SizedBox(
                height: 10,
              ),
              child
            ],
          ),
      ],
    ),
  );
}

Widget drugCard(
    {required String img,
    required String nameDrug,
    required String qtyDrug,
    required String time}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Image.asset(
              img,
              scale: 3,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textButton1(nameDrug.isNoData(), color.black87, maxLines: 10),
              textButton2(
                qtyDrug.isNoData(),
                color.black87,
              ),
              textOverline2(
                time.isNoData(),
                color.black87,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
