import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/elderly_address/bloc/elderly_address_bloc.dart';
import 'package:health_application/ui/google_map/googlemap.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

class ManageAddressElderly extends StatelessWidget {
  const ManageAddressElderly({super.key, required this.type});

  final ManageAddressType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.white,
      appBar: appBar(
          onBack: () {
            Navigator.pop(context);
          },
          images: 'assets/images/exit_icon.png',
          title:
              type == ManageAddressType.add ? 'เพิ่มที่อยู่' : 'แก้ไขที่อยู่'),
      body: GoogleMaps(),
    );
  }
}
