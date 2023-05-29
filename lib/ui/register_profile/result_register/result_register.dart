import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/signIn_page/signIn_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ResultRegisterWidget extends StatelessWidget {
  const ResultRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/success_pic.png',
                  scale: 3,
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                    child: textSubtitle24(
                        'เปิดบัญชีสำเร็จแล้ว', ColorTheme().black87)),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: textSubtitle2(
                        'เริ่มใช้งานบัญชีของคุณได้แล้ว\nขอให้สนุกกับการใช้งานเราจะดูแลคุณเอง',
                        ColorTheme().black87,
                        true)),
                const SizedBox(
                  height: 30,
                ),
                ButtonGradient(
                  btnName: 'เริ่มต้นใช้งาน',
                  onClick: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
