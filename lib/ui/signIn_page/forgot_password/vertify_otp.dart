import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/signIn_page/bloc/sign_in_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../base/widget/text_field_widget.dart';

class VertifyOTPWidget extends StatelessWidget {
  const VertifyOTPWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorTheme().white,
        appBar: appBar(
            onBack: () {
              context
                  .read<SignInBloc>()
                  .add(ChangeSection(view: SectionView.forgotPassword));
            },
            title: 'ลืมรหัสผ่าน'),
        body: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: textSubtitle24W700(
                            'ยืนยันเบอร์มือถือของคุณ', ColorTheme().black87),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: textSubtitle2(
                            'โปรดกรอกรหัส OTP ที่ส่งไปยังเบอร์',
                            ColorTheme().black87,
                            true),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: textSubtitle2('xxx-xxx-8845 (ref:XWVW9p )',
                            ColorTheme().black87, true),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextFieldWidget.enable(
                              height: 80,
                              text: '',
                              maxLength: 1,
                              textNumberType: true,
                              hintText: '',
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: TextFieldWidget.enable(
                              height: 80,
                              text: '',
                              maxLength: 1,
                              textNumberType: true,
                              hintText: '',
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: TextFieldWidget.enable(
                              height: 80,
                              text: '',
                              textNumberType: true,
                              maxLength: 1,
                              hintText: '',
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: TextFieldWidget.enable(
                              text: '',
                              height: 80,
                              maxLength: 1,
                              textNumberType: true,
                              hintText: '',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textCaption1(
                              'ไม่ได้รับรหัส OTP?  ส่งรหัสอีกครั้ง ใน ',
                              ColorTheme().black87),
                          textCaption1('04:57 ', ColorTheme().Primary),
                          textCaption1('นาที', ColorTheme().black87),
                        ],
                      )
                      //04:57 นาที
                    ],
                  ),
                  ButtonGradient(
                    btnName: 'ยืนยัน',
                    onClick: () {
                      context
                          .read<SignInBloc>()
                          .add(ChangeSection(view: SectionView.resetPassword));
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
