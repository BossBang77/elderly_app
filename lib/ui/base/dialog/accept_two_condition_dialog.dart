import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/base/widget/button_blue_fade.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/button_red.dart';
import 'package:health_application/ui/base/widget/button_red_fade.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../ui-extensions/color.dart';

class AcceptTwoCondition extends StatelessWidget {
  const AcceptTwoCondition({
    Key? key,
    required this.header,
    required this.subtitle,
  }) : super(key: key);

  ///header
  final String header;

  ///subtitle
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    ColorTheme colors = new ColorTheme();

    return Stack(
      children: <Widget>[
        const Opacity(
          opacity: 0.1,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
        AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Padding(
            padding: const EdgeInsets.only(top: 15, left: 0, right: 0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  textSubtitle24W700(header, colors.black87),
                  const SizedBox(
                    height: 10,
                  ),
                  textButton1(subtitle, colors.black87,
                      align: TextAlign.center, maxLines: 5),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    ButtonGradient(
                      btnName: 'ยืนยัน',
                      onClick: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonBlueFade(
                      btnName: 'ยกเลิก',
                      onClick: () {
                        Navigator.pop(context, false);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }
}
