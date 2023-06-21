import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../ui-extensions/color.dart';

class HealthMenu extends StatelessWidget {
  const HealthMenu(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.callback,
      this.nullData = false,
      this.isEdit = true});
  final String title;
  final String subtitle;
  final VoidCallback callback;
  final bool nullData;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback(),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textSubtitle16Blod(title, color.black87),
                Row(
                  children: [
                    textButton1(
                        subtitle, nullData ? color.greyText : color.black87),
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                      color: (isEdit) ? null : color.whiteBackground,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
