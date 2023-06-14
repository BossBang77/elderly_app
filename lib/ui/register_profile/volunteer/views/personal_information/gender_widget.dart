import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    required this.gender, 
    required this.image,
    required this.selectedImage,
    this.isSelected = false,
    this.onTap
  });
  final String gender;
  final String image;
  final String selectedImage;
  final bool isSelected;
  final Function? onTap;

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(23, 10, 23, 10),
        decoration: BoxDecoration(
          color: isSelected ? ColorTheme().blueText : ColorTheme().white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorTheme().grey10)
        ),
        child: Row(
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: Image.asset(isSelected ?  selectedImage : image),
            ),
            textSubtitle2(gender, isSelected ? ColorTheme().white : ColorTheme().black87, false)
          ],
        ),
      )
    );
  }
}