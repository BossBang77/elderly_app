import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/notification.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

PreferredSizeWidget appBar(
    {required VoidCallback onBack,
    String title = '',
    bool showNotification = false,
    bool showBackbutton = true,
    Widget suffixAction = const SizedBox()}) {
  return AppBar(
    elevation: 0,
    shadowColor: ColorTheme().white,
    backgroundColor: ColorTheme().white,
    centerTitle: true,
    title: textSubtitle18W800(title, ColorTheme().black87),
    leading: showBackbutton
        ? BackButtonWidget(onClick: () {
            onBack();
          })
        : null,
    actions: [
      showNotification ? NotificationAlert() : Container(),
      suffixAction
    ],
  );
}
