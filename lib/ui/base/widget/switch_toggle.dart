import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

class SwitchToggle extends StatelessWidget {
  const SwitchToggle({super.key, required this.value, required this.onChange});
  final bool value;
  final ValueChanged<bool>? onChange;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        activeColor: color.BlueDark,
        thumbColor: color.white,
        trackColor: color.GreyBorder,
        value: value,
        onChanged: (value) => onChange?.call(value));
  }
}
