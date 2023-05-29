import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotificationAlert extends StatelessWidget {
  const NotificationAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      true ? 'assets/images/bell_unalert.png' : 'assets/images/notify.png',
      scale: 4,
    );
  }
}
