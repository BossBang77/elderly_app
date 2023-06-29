import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../ui-extensions/color.dart';

///errordialog
class WarningDialog extends StatelessWidget {
  ///constructor
  const WarningDialog(
      {Key? key,
      required this.header,
      required this.subtitle,
      this.onTap,
      this.buttonName})
      : super(key: key);

  ///header
  final String header;

  ///subtitle
  final String subtitle;

  final buttonName;

  ///onTap
  final Function()? onTap;

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
                  SizedBox(
                      child: Image.asset(
                    'assets/images/warning_dialog_alert.png',
                    scale: 3,
                  )),
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
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: <Widget>[
                    ButtonGradient(
                      btnName: buttonName,
                      onClick: () {
                        Navigator.pop(context, true);
                        onTap!();
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
