
import 'package:flutter/material.dart';

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({super.key, required this.onClick});
  final VoidCallback? onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onClick!();
        },
        child: Image.asset(
          'assets/images/close_icon.png',
          scale: 4,
        ));
  }
}