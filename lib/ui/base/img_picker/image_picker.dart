import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PickerFile {
  XFile? pickedFile;
  CroppedFile? croppedFile;

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
      }
    }
  }

  Future<void> pickImage(BuildContext context) async {
    final file = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 25,
        maxHeight: 1024,
        maxWidth: 1024);
    if (file != null) {
      pickedFile = file;
    }
  }

  void clear() {
    pickedFile = null;
    croppedFile = null;
  }
}
