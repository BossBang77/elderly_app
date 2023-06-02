import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/star_rateing.dart';

import '../../ui-extensions/color.dart';
import '../linear_percent_indicator/linear_percent_indicator.dart';

Widget SliderWidget(
    {required double maxValue,
    required double value,
    int divisions = 1,
    double label = 0,
    ValueChanged<double>? onChange}) {
  return Slider(
    value: value,
    max: maxValue,
    divisions: divisions,
    thumbColor: color.DartBlue,
    activeColor: color.DartBlue,
    inactiveColor: color.greyText,
    label: label.round().toString(),
    onChanged: (double value) {
      onChange?.call(value);
    },
  );
}

Widget RateingBar(BuildContext context,
    {required int starValue, required double barpercent}) {
  return Row(
    children: [
      StarRate(context, starValue),
      Flexible(
        child: LinearPercentIndicator(
          lineHeight: 8.0,
          percent: barpercent,
          progressColor: color.DartBlue,
          backgroundColor: color.grey50.withOpacity(0.2),
          barRadius: Radius.circular(10),
        ),
      )
    ],
  );
}
