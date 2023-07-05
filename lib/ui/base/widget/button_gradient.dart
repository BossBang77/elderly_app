import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ButtonGradient extends StatelessWidget {
  const ButtonGradient({super.key, required this.btnName, this.onClick = null});
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
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(1.00, 0.02),
            end: Alignment(-1, -0.02),
            colors: [Color(0xFF437ECB), Color(0xFF4AB4C0)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: textBody1(btnName, ColorTheme().white),
        ),
      ),
    );
  }
}
