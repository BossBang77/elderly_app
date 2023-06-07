import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BackButtonCircleWidget extends StatelessWidget {
  const BackButtonCircleWidget({super.key, required this.onClick});
  final VoidCallback? onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onClick!();
        },
        child: Container(
          margin: EdgeInsets.all(10),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: Colors.white.withAlpha(125)
          ),
          child: Image.asset(
            'assets/images/back_arrow.png',
            scale: 4,
          )
        )
    );
  }
}
