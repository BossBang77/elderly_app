import 'package:flutter/material.dart';

import '../../ui-extensions/color.dart';

Widget StarRate(BuildContext context, int value) {
  return Row(
    children: [
      for (int i = 0; i < 5; i++)
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 5, 5),
          child: Image.asset(
            'assets/images/star_white.png',
            scale: 4,
            color: i < value ? Colors.amber : color.grey50,
          ),
        )
    ],
  );
}
