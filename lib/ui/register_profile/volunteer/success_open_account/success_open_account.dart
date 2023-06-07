import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class SuccessOpenAccount extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(onBack: (){}),
      backgroundColor: ColorTheme().white,
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 60, right: 60),
              child: Image.asset('assets/images/success_image.png')
            ),
            Center(child: textH5('เปิดบัญชีสำเร็จแล้ว', ColorTheme().black87, false)),
            SizedBox(height: 18),
            textSubtitle2('เริ่มใช้งานบัญชีของคุณได้แล้ว\nขอให้สนุกกับการใช้งาน เราจะดูแลคุณเอง', ColorTheme().black87, true),
            SizedBox(height: 40),
            ButtonGradient(btnName: 'เริ่มต้นใช้งาน')
          ],
        )
      )
    );
  }
}