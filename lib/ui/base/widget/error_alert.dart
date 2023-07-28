import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/button_blue_fade.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ErrorAlertWidget extends StatelessWidget {
  const ErrorAlertWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.btnName})
      : super(key: key);

  final String title;
  final String subTitle;
  final String btnName;

  @override
  Widget build(BuildContext context) {
    final Widget acceptButton = SizedBox(
        width: 210,
        height: 50,
        child: ButtonGradient(
          btnName: btnName,
          onClick: () {
            Navigator.pop(context, true);
          },
        ));

    return Stack(
      children: <Widget>[
        const Opacity(
          opacity: 0.1,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
        AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          title: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/un_success.png',
                    scale: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textSubtitle18Blod(title, ColorTheme().black87),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: textButton1(subTitle, color.black87,
                          align: TextAlign.center, maxLines: 3)),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Center(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[acceptButton],
              ),
            )),
          ],
        )
      ],
    );
  }
}
