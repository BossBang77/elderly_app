
import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AppointmentStatusStep<ValueType> extends StatelessWidget {
  const AppointmentStatusStep({
    required this.width, 
    required this.stepValues, 
    this.maxSpacing = 37,
    this.currentStep
  });
  final double width;
  final double maxSpacing;
  final List<AppointmentStatusItem<ValueType>> stepValues;
  final ValueType? currentStep;

  @override 
  Widget build(BuildContext context) {
    final numberOfWidgets = stepValues.length + (stepValues.length - 1);
    final stepContainerWidth = (width / stepValues.length);
    final stepWidth = 48;
    final spaceBetweenStep = (((stepContainerWidth / 2) - 24) * 2);
    final startDrawPosition = ((stepContainerWidth / 2) + (stepWidth / 2) - 5);

    int valueIndex = -1;
    int separatorIndex = -1;

    final currentStepIndex = stepValues.indexWhere((item) => item.value == currentStep);
    List<Widget> widgets = List<Widget>.generate(numberOfWidgets, (index) {

      if (index % 2  == 0) { 
        valueIndex += 1;
        final isCompleted = currentStepIndex >= valueIndex;
        final nextStepPosition = valueIndex * stepContainerWidth;
        return Padding(
          padding: EdgeInsets.only(left: nextStepPosition),
          child: AppointmentStep(
            title: stepValues[valueIndex].title, 
            description: stepValues[valueIndex].description,
            isCompleted: isCompleted,
            width: stepContainerWidth,
            maxWidth: stepContainerWidth
          ),
        );
      }

      separatorIndex += 1;
      final isCompleted = currentStepIndex > separatorIndex;
      final nextSeparatorPosition = startDrawPosition + (separatorIndex * (spaceBetweenStep + stepWidth));
      return Padding(
        padding: EdgeInsets.only(left: nextSeparatorPosition),
        child: StepSeparator(width: spaceBetweenStep + 10, isCompleted: isCompleted)
      );
    });

    return Container(
      color: Colors.white,
      child: Center(
        child: Stack(
          children: widgets,
      ))
    );
  }
}

class AppointmentStatusItem<ValueType> {
  const AppointmentStatusItem({required this.value, required this.title, this.description = ''});
  final ValueType value;
  final String title;
  final String description;
}

Widget AppointmentStep({
  required String title,
  required String description,
  required bool isCompleted,
  required double width,
  double maxWidth = 54
}) => Container(
  width: width,
  child: Column(
    children: [
      Container(
        height: 48,
        width: 48,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: isCompleted ? ColorTheme().blueText : Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(48)
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isCompleted ? ColorTheme().blueText : ColorTheme().blueText.withAlpha(25),
            borderRadius: BorderRadius.circular(44)
          ),
          child: Center(child: textSubtitle1(title, ColorTheme().white)),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 4, right: 4),
        color: Colors.white,
        constraints: BoxConstraints(minWidth: maxWidth, maxWidth: maxWidth),
        child: Center(child: textSubtitle2(description, ColorTheme().black87, true))
      )
    ],
  )
);

Widget StepSeparator({double width = 37, bool isCompleted = false}) => Container(
  width: width,
  height: 48,
  child: Center(child: Container(
    width: width,
    height: 1,
    color: isCompleted ? ColorTheme().blueText : ColorTheme().blueText.withAlpha(25),
  ))
);