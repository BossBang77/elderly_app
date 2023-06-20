import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ScanErrorDialog extends StatelessWidget {
  const ScanErrorDialog({super.key});

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
                    'assets/images/success_icon.png',
                    scale: 3,
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  textSubtitle24W700('ไม่สามารถสแกนได้', colors.black87),
                  const SizedBox(
                    height: 10,
                  ),
                  textButton1('QR Code ไม่ถูกต้อง', colors.black87,
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
                      btnName: 'ตกลง',
                      onClick: () {
                        Navigator.pop(context);
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
