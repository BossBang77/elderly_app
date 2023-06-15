import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_application/ui/home_page/component/dialog/scan_error_dialog.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/volunteer/search_elderly/search_elderly_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({Key? key, required this.onScan}) : super(key: key);

  final Function onScan;

  @override
  State<StatefulWidget> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey();
  final picker = ImagePicker();
  late QRViewController control;
  @override
  void initState() {
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else {
      controller!.resumeCamera();
    }
  }

  Future<void> _getPhotoByGallery() async {
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else {
      controller!.resumeCamera();
    }

    try {
      var image = await ImagePicker().getImage(source: ImageSource.gallery);
      if (image == null) return;
      String? result = await Scan.parse(image.path);
      widget.onScan.call(result);
      controller!.dispose();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(flex: 4, child: _buildQrView(context)),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    textSubtitle24W700(
                        'กรุณาสแกน QR code \nเพื่อค้นหาข้อมูลผู้สูงอายุ',
                        color.greyText,
                        align: TextAlign.center),
                  ],
                ),
              )
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.6,
              left: MediaQuery.of(context).size.width * 0.9,
              child: InkWell(
                  onTap: () => _getPhotoByGallery(),
                  child: Image.asset(
                    'assets/images/pic_img_icon.png',
                    scale: 4,
                  ))),
          Positioned(
              top: 40,
              left: MediaQuery.of(context).size.width * 0.05,
              child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'assets/images/close_qr_icon.png',
                    scale: 4,
                  )))
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 270.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: color.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController c) {
    setState(() {
      controller = c;
    });
    c.resumeCamera();
    c.scannedDataStream.listen((scanData) {
      if (scanData != null) {
        print('scan data = ${scanData.code}');
        widget.onScan.call(scanData.code);
        controller?.stopCamera();
        // controller?.dispose();
      }
    }, onError: (_) {
      print('error scan ');
      showDialog(
          context: context,
          builder: (_) {
            return ScanErrorDialog();
          }).then((value) => {controller?.resumeCamera()});
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
