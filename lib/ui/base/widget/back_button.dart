import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key, required this.onClick});
  final VoidCallback? onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onClick!();
        },
        child: Image.asset(
          'assets/images/back_arrow.png',
          scale: 4,
        ));
  }
}
