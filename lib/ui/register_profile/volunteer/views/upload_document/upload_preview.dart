import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class UploadPreview extends StatelessWidget {
  const UploadPreview(
      {required this.title,
      this.image = '',
      required this.pickPicture,
      required this.delPicture,
      this.isCheckAction = false,
      required this.sized});
  final String title;
  final String image;
  final VoidCallback pickPicture;
  final VoidCallback delPicture;
  final bool isCheckAction;
  final double sized;

  @override
  Widget build(BuildContext context) {
    Widget uploadButton() {
      double imageRatio = 54 / 327;
      double imageWidth = MediaQuery.of(context).size.width - 32;
      double imageHeight = imageRatio * imageWidth;

      return InkWell(
        onTap: () {
          pickPicture();
        },
        child: Container(
          height: imageHeight,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              isCheckAction && image.isEmpty
                  ? 'assets/images/dashed_border_error.png'
                  : 'assets/images/dashed_border.png',
            ),
            fit: BoxFit.contain,
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 18,
                height: 18,
                child: Image.asset('assets/images/camera_icon.png'),
              ),
              textSubtitle2(' + ${title}', ColorTheme().black87, false)
            ],
          ),
        ),
      );
    }

    Widget preview() {
      double imageRatio = 190 / 327;
      double imageWidth = MediaQuery.of(context).size.width - 32;
      double imageHeight = imageRatio * imageWidth;

      return Container(
          height: imageHeight,
          width: imageWidth,
          decoration: BoxDecoration(
              color: ColorTheme().grey10,
              borderRadius: BorderRadius.circular(12),
              border: sized < 10 ? null : Border.all(color: color.Error),
              image: DecorationImage(
                  image: FileImage(new File(image)),
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                width: 30,
                height: 30,
                top: 12,
                right: 12,
                child: Container(
                    decoration: BoxDecoration(
                      color: ColorTheme().GreyBackGround.withAlpha(15),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                      onTap: () {
                        delPicture();
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Image.asset('assets/images/trash_icon.png'),
                      ),
                    )),
              )
            ],
          ));
    }

    return image.isEmpty ? uploadButton() : preview();
  }
}
