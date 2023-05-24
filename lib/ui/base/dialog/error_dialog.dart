import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../ui-extensions/color.dart';

///errordialog
class ErrorTryDialogWidget extends StatelessWidget {
  ///constructor
  const ErrorTryDialogWidget(
      {Key? key,
      required this.header,
      required this.subtitle,
      this.time,
      this.onTap})
      : super(key: key);

  ///header
  final String header;

  ///subtitle
  final String subtitle;

  ///onTap
  final Function()? onTap;

  ///time
  final int? time;
  @override
  Widget build(BuildContext context) {
    ColorTheme colors = new ColorTheme();
    final Widget backToHomeButton = SizedBox(
      width: 120.w,
      height: 25.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(ColorTheme().Primary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(
                color: ColorTheme().Primary,
              ),
            ),
          ),
        ),
        onPressed: onTap,
        child: textButton1("ตกลง", colors.Surface),
      ),
    );
    return Stack(
      children: <Widget>[
        const Opacity(
          opacity: 0.1,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
        AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Padding(
            padding: const EdgeInsets.only(top: 15, left: 75, right: 75),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                      child: Image.asset(
                    'assets/images/Icon_expiredtoken.png',
                    width: 75,
                    height: 75,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  textH6(header, colors.PrimaryVariant, true),
                  const SizedBox(
                    height: 10,
                  ),
                  textSubtitle2(subtitle, colors.SecondaryVariant, true),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Center(
                child: Column(
              children: <Widget>[
                backToHomeButton,
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
