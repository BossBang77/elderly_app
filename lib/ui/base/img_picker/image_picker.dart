import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/button_blue_fade.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PickerFile {
  XFile? pickedFile;
  CroppedFile? croppedFile;
  int oneMbToByte = 1048576;

  PickerFile({this.pickedFile, this.croppedFile});
  Future<void> cropImage(BuildContext context) async {
    if (pickedFile != null) {
      final cropped = await ImageCropper().cropImage(
        sourcePath: pickedFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 40,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: color.Blue,
              toolbarWidgetColor: color.white,
              initAspectRatio: CropAspectRatioPreset.ratio4x3,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
                const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (cropped != null) {
        croppedFile = cropped;
        pickedFile = XFile(croppedFile!.path);
      }
    }
  }

  Future<void> pickImage(BuildContext context, {ImageSource? source}) async {
    final file = await ImagePicker().pickImage(
        source: source ?? ImageSource.gallery,
        imageQuality: 25,
        maxHeight: 1024,
        maxWidth: 1024);
    if (file != null) {
      pickedFile = file;
    }
  }

  Future<XFile?> pickImageAndCrop(BuildContext context,
      {ImageSource? source}) async {
    await pickImage(context, source: source);
    await cropImage(context);
    return pickedFile;
  }

  void clear() {
    pickedFile = null;
    croppedFile = null;
  }

  Future<double> getFileSizeMB(String path) async {
    final fileBytes = await File(path).readAsBytes();
    return double.parse(
        (fileBytes.lengthInBytes / oneMbToByte).toStringAsFixed(2));
  }
}

Future<ImageSource?> showImageSource(BuildContext context) async {
  return showModalBottomSheet(
      context: context,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SpaceWidget(
                  height: 30,
                ),
                ButtonBlueFade(
                  btnName: 'ถ่ายภาพ',
                  onClick: () {
                    Navigator.of(context).pop(ImageSource.camera);
                  },
                ),
                SpaceWidget(
                  height: 20,
                ),
                ButtonBlueFade(
                  btnName: 'เลือกจากอัลบั้ม',
                  onClick: () {
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                ),
                SpaceWidget(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop(null);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: textBody1('ยกเลิก', ColorTheme().Primary),
                  ),
                ),
                SpaceWidget(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      });
}
