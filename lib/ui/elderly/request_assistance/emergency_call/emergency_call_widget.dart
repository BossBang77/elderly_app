import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

class EmergrncyCallWidget extends StatelessWidget {
  const EmergrncyCallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.whiteBackground,
      appBar: appBar(onBack: () {}, title: ''),
      body: Container(),
    );
  }
}
