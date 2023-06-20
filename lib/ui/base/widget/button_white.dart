import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ButtonWhite extends StatelessWidget {
  const ButtonWhite({super.key, required this.btnName, this.onClick = null});
  final String btnName;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick!();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: ColorTheme().white),
        child: Center(
          child: textBody1(btnName, ColorTheme().black87),
        ),
      ),
    );
  }
}
