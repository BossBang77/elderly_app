import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/register_profile/volunteer/views/upload_document/upload_preview.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class UploadDocumentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: 'โปรไฟล์ของฉัน', onBack: () {}),
        backgroundColor: ColorTheme().white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    color: ColorTheme().white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textSubtitle18Blod(
                            'สำเนาบัตรประชาชน', ColorTheme().black87),
                        textSubtitle15w400(
                            'อัปโหลดรูปบัตรประชาชนและใบหน้าเจ้าของบัตร',
                            ColorTheme().black87),
                        const SizedBox(
                          height: 20,
                        ),
                        textSubtitle18Blod(
                            'รูปหน้าบัตรประชาชน', ColorTheme().black87),
                        const SizedBox(
                          height: 10,
                        ),
                        UploadPreview(
                          title: 'รูปหน้าบัตรประชาชน',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        textSubtitle15w400(
                            '.pdf .png .jpg 10M', ColorTheme().grey50),
                        const SizedBox(
                          height: 20,
                        ),
                        textSubtitle18Blod(
                            'รูปคู่บัตรประชาชน', ColorTheme().black87),
                        const SizedBox(
                          height: 10,
                        ),
                        UploadPreview(
                          title: 'รูปคู่บัตรประชาชน',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        textSubtitle15w400(
                            '.pdf .png .jpg 10M', ColorTheme().grey50),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
                Container(
                    color: ColorTheme().scaffoldGreyBackground, height: 10),
                Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    color: ColorTheme().white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        textSubtitle18Blod(
                            'สำเนาบัตรจิตอาสา', ColorTheme().black87),
                        textSubtitle15w400(
                            'อัปโหลดรูปบัตรจิตอาสาและใบหน้าเจ้าของบัตร',
                            ColorTheme().black87),
                        const SizedBox(
                          height: 20,
                        ),
                        textSubtitle18Blod(
                            'สำเนาบัตรจิตอาสา', ColorTheme().black87),
                        const SizedBox(
                          height: 10,
                        ),
                        UploadPreview(
                          title: 'รูปหน้าบัตรประชาชน',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        textSubtitle15w400(
                            '.pdf .png .jpg 10M', ColorTheme().grey50),
                        const SizedBox(
                          height: 20,
                        ),
                        textSubtitle18Blod(
                            'รูปคู่บัตรจิตอาสา', ColorTheme().black87),
                        const SizedBox(
                          height: 10,
                        ),
                        UploadPreview(
                          title: 'รูปคู่บัตรจิตอาสา',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        textSubtitle15w400(
                            '.pdf .png .jpg 10M', ColorTheme().grey50),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ButtonGradient(
                          btnName: 'ถัดไป',
                          onClick: () {},
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
