import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import '../../../ui-extensions/color.dart';

class NotFoundExcerise extends StatelessWidget {
  const NotFoundExcerise({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/images/person_exercise_icon.png',
            scale: 3,
          ),
        ),
        Center(
          child: textSubtitle18Blod(
              'คุณยังไม่ได้เพิ่ม\nกิจกรรมออกกำลังกาย', color.grey50,
              align: TextAlign.center),
        )
      ],
    );
  }
}
