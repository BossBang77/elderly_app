import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/button_blue_fade.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ErrorAlertWidget extends StatelessWidget {
  const ErrorAlertWidget(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final Widget acceptButton = SizedBox(
        width: 210,
        height: 50,
        child: ButtonGradient(
          btnName: 'ตกลง',
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
                  Icon(
                    Icons.error,
                    color: color.Error,
                    size: 80,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textSubtitle18Blod(title, ColorTheme().Error),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: textButton1(subTitle, Colors.grey,
                          align: TextAlign.center)),
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
              padding: const EdgeInsets.only(bottom: 50),
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
