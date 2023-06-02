import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class TimeLineProgress extends StatelessWidget {
  final int ticks;
  final int sized;
  final List<Widget> label;
  TimeLineProgress({
    required this.ticks,
    this.sized = 0,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  for (int i = 0; i < sized; i++)
                    Row(children: [
                      tick(this.ticks > i, i),
                      i != sized - 1 ? line(this.ticks > i + 1) : Container(),
                    ]),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [for (int i = 0; i < label.length; i++) label[i]],
              ),
            )
          ],
        ));
  }

  Widget tick(bool isChecked, int index) {
    return Container(
      constraints: BoxConstraints(maxWidth: 50),
      child: Column(
        children: [
          isChecked
              ? Image.asset(
                  'assets/images/progress_${index + 1}_enable.png',
                  scale: 4,
                )
              : Image.asset(
                  'assets/images/progress_${index + 1}_disable.png',
                  scale: 4,
                ),
        ],
      ),
    );
  }

  Widget line(bool active) {
    return Container(
      color: active ? color.BlueDark : ColorTheme().BlueFade2.withOpacity(0.1),
      height: 3.0,
      width: 55,
    );
  }
}
