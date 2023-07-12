import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget(
      {super.key,
      required this.onClick,
      this.imgPath = 'assets/images/back_arrow.png'});
  final VoidCallback? onClick;
  final String imgPath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onClick!();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imgPath,
            scale: 4,
          ),
        ));
  }
}
