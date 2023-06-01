import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ToggleFilterItemWidget extends StatelessWidget {
  // bool isSelected = false;
  const ToggleFilterItemWidget({this.name = '', this.description = '', this.onChanged, this.isChecked = false});
  final String name;
  final String description;
  final Function(bool)? onChanged;
  final bool isChecked;

  @override 
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 16, top: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      textBody1(name, ColorTheme().black87),
                      textBody2(description, ColorTheme().black87, false)
                    ],
                  ),
                  Switch.adaptive(
                    value: isChecked, 
                    onChanged: (isChecked){ 
                      // setState(() {
                        // isSelected = !isSelected;
                        onChanged?.call(isChecked);
                      // });
                    }
                  )
                ],
              ),
            ],
          )
        ),

        Container(height: 1, color: ColorTheme().GreyBorder)
      ],
    );
    
  }
}