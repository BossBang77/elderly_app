import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

PreferredSizeWidget appBar({required VoidCallback onBack, String title = ''}) {
  return AppBar(
    elevation: 0,
    shadowColor: ColorTheme().white,
    backgroundColor: ColorTheme().white,
    centerTitle: true,
    title: textSubtitle18W800(title, ColorTheme().black87),
    leading: BackButtonWidget(onClick: () {
      onBack();
    }),
  );
}
