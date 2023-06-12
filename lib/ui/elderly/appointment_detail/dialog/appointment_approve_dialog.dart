import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/button_blue_fade.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/button_red.dart';
import 'package:health_application/ui/base/widget/button_red_fade.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AppointmentApproveDialog extends StatelessWidget {
  const AppointmentApproveDialog({
    this.theme = AppointmentApproveDialogTheme.confirm,
    this.title = '',
    this.description = '',
    this.onConfirm
  });
  
  final String title;
  final String description;
  final Function? onConfirm;
  final AppointmentApproveDialogTheme theme;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      contentPadding: EdgeInsets.only(left: 35, right: 35),
      title: Center(child: textSubtitle18Blod('ยืนยันการนัดหมาย', ColorTheme().black87)),
      titlePadding: EdgeInsets.only(left: 35, right: 35, top: 35),
      actionsPadding: EdgeInsets.only(left: 35, right: 35, bottom: 35),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Center(child: 
              textButton1(
                'คุณยืนยันการนัดหมายนี้ใช่หรือไม่', 
                color.black87, 
                align: TextAlign.center, 
                maxLines: 3
              )
            ),
            SizedBox(height: 32),
          ],
        )
      ),
      actions: [
        theme.confirmButton(
          onClick: (result){
            Navigator.of(context).pop(result);
          },
        ),
        SizedBox(height: 24),
        theme.cancelButton(
          onClick: (){
            Navigator.of(context).pop(AppointmentApproveDialogResult.cancelAction);
          }
        )
      ],
    );
  }
}

enum AppointmentApproveDialogResult {
  confirmAppointment,
  cancelAppointment,
  cancelAction
}

enum AppointmentApproveDialogTheme {
  destructive,
  confirm;

  Widget confirmButton({Function(AppointmentApproveDialogResult)? onClick}) {
    switch (this){
      case AppointmentApproveDialogTheme.destructive : 
        return ButtonRed(
          btnName: 'ปฎิเสธการนัดหมาย',
          onClick: () { onClick?.call(AppointmentApproveDialogResult.cancelAppointment); },
        );
      case AppointmentApproveDialogTheme.confirm : 
        return ButtonGradient(
          btnName: 'ยืนยัน',
          onClick: () { onClick?.call(AppointmentApproveDialogResult.confirmAppointment); },
        );
    }
  }

  Widget cancelButton({Function? onClick}) {
    switch (this){
      case AppointmentApproveDialogTheme.destructive : 
        return ButtonRedFade(
          btnName: 'ยกเลิก',
          onClick: () { onClick?.call(); },
        );
      case AppointmentApproveDialogTheme.confirm : 
        return ButtonBlueFade(
          btnName: 'ยกเลิก',
          onClick: () { onClick?.call(); },
        );
    }
  }
}