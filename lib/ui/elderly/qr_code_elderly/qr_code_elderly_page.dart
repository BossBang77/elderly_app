import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:screenshot/screenshot.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';
import '../../base/app_config/app_config.dart';
import '../../base/dialog/success_dialog.dart';

class QrCodeElderlyPage extends StatefulWidget {
  const QrCodeElderlyPage({super.key, required this.uuid});
  final String uuid;

  @override
  State<QrCodeElderlyPage> createState() => _QrCodeElderlyPageState();
}

class _QrCodeElderlyPageState extends State<QrCodeElderlyPage> {
  String qrTxt = '';
  ScreenshotController screenshotController = ScreenshotController();
  @override
  void initState() {
    // TODO: implement initState

    qrTxt = widget.uuid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;

    Future<void> _captureAndShareJpeg() async {
      screenshotController.capture().then((Uint8List? image1) async {
        //Capture Done
        Uint8List file = image1 ?? base64.decode('not found');
        DocumentFileSavePlus.saveFile(
            file, "Elder- ${widget.uuid}.jpg", "image/jpeg");
        if (Platform.isAndroid) {
          await showDialog(
              context: context,
              builder: (BuildContext context) => SuccessDialog(
                    header: 'สำเร็จ!',
                    subtitle: 'บันทึก QR สำเร็จ',
                    buttonName: 'ตกลง',
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                  ));
        }
      }).catchError((onError) async {
        print(onError);
        await showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertWidget(
                  title: 'เกิดข้อผิดพลาด',
                  subTitle: "ไม่สามารถบันทึกQR Codeได้\nกรุณาลองใหม่อีกครั้ง",
                  btnName: 'ตกลง',
                ));
      });
    }

    return Scaffold(
      appBar: appBar(
          onBack: () {
            Navigator.pop(context);
          },
          title: 'QR code ของฉัน'),
      body: Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Screenshot(
                  controller: screenshotController,
                  child: Container(
                    color: color.white,
                    child: PrettyQr(
                        image: AssetImage('assets/images/login_logo.png'),
                        typeNumber: 4,
                        size: 300,
                        elementColor: color.black87,
                        data: qrTxt,
                        errorCorrectLevel: QrErrorCorrectLevel.Q,
                        roundEdges: true),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: textSubtitle18Blod(
                      'แสดงหรือส่ง QR code ของคุณ \nให้เจ้าหน้าที่/จิตอาสา\nเพื่อดูข้อมูลของคุณ',
                      color.greyText,
                      align: TextAlign.center),
                ),
                const SizedBox(
                  height: 70,
                ),
                ButtonGradient(
                    btnName: 'บันทึก QR code',
                    onClick: () {
                      _captureAndShareJpeg();
                    }),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      int random = Random().nextInt(39) + 1;
                      setState(() {
                        qrTxt = widget.uuid + 'resetQR${random.toString()}';
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.restart_alt_rounded),
                        textButton1('โหลดใหม่', color.black87,
                            align: TextAlign.center),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
    );
  }
}
