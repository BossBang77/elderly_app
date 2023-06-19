import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../ui-extensions/color.dart';

class TitleHeaderWidget extends StatelessWidget {
  const TitleHeaderWidget(
      {super.key, this.title = '', this.isMandatory = false});
  final String title;
  final bool isMandatory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        textSubtitle16Blod(title, color.black87),
        if (isMandatory) ...{
          textSubtitle16Blod('*', color.Error),
        }
      ],
    );
  }
}
