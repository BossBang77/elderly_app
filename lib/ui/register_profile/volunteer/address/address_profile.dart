import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/register_profile/volunteer/address/dropdown_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AddressProfile extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'โปรไฟล์ของฉัน',
        onBack: (){}
      ),
      backgroundColor: ColorTheme().white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textSubtitle18Blod('ที่อยู่ตามทะเบียนบ้าน', ColorTheme().black87),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        textSubtitle18Blod('เลขที่*', ColorTheme().black87),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget.enable(
                          text: '',
                          textNumberType: true,
                          maxLength: 50,
                          hintText: 'เลขที่',
                          onChanged: (value) {
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        textSubtitle18Blod('*จำเป็น', ColorTheme().grey50),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        textSubtitle18Blod('เลขที่ห้อง', ColorTheme().black87),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget.enable(
                          text: '',
                          textNumberType: true,
                          maxLength: 50,
                          hintText: 'เลขที่ห้อง',
                          onChanged: (value) {
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  )
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        textSubtitle18Blod('ชั้น', ColorTheme().black87),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget.enable(
                          text: '',
                          textNumberType: true,
                          maxLength: 50,
                          hintText: 'ชั้น',
                          onChanged: (value) {
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        textSubtitle18Blod('หมู่ที่', ColorTheme().black87),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget.enable(
                          text: '',
                          textNumberType: true,
                          maxLength: 50,
                          hintText: 'หมู่ที่',
                          onChanged: (value) {
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  )
                ],
              ),
              
              textSubtitle18Blod('ซอย', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget.enable(
                text: '',
                onTap: () {

                },
                maxLength: 50,
                hintText: 'ซอย',
                onChanged: ((value) {

                }),
              ),
              const SizedBox(
                height: 20,
              ),

              textSubtitle18Blod('อาคาร/หมู่บ้าน', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget.enable(
                text: '',
                onTap: () {

                },
                maxLength: 50,
                hintText: 'อาคาร/หมู่บ้าน',
                onChanged: ((value) {

                }),
              ),
              const SizedBox(
                height: 20,
              ),

              textSubtitle18Blod('ถนน', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget.enable(
                text: '',
                onTap: () {

                },
                maxLength: 50,
                hintText: 'ถนน',
                onChanged: ((value) {

                }),
              ),
              const SizedBox(
                height: 20,
              ),

              textSubtitle18Blod('รหัสไปรษณีย์', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget.enable(
                text: '',
                onTap: () {

                },
                maxLength: 50,
                hintText: 'รหัสไปรษณีย์',
                onChanged: ((value) {

                }),
              ),
              const SizedBox(
                height: 10,
              ),
              textSubtitle18Blod('*จำเป็น', ColorTheme().grey50),
              const SizedBox(
                height: 20,
              ),

              textSubtitle18Blod('จังหวัด', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              DropdownWidget(
                hint: 'จังหวัด',
              ),
              const SizedBox(
                height: 10,
              ),
              textSubtitle18Blod('*จำเป็น', ColorTheme().grey50),
              const SizedBox(
                height: 20,
              ),

              textSubtitle18Blod('เขต/อำเภอ', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              DropdownWidget(
                hint: 'เขต/อำเภอ',
              ),
              const SizedBox(
                height: 10,
              ),
              textSubtitle18Blod('*จำเป็น', ColorTheme().grey50),
              const SizedBox(
                height: 20,
              ),

              textSubtitle18Blod('แขวง/ตำบล', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              DropdownWidget<String>(
                hint: 'แขวง/ตำบล',
                items: ['di', 'did'].map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
                onChanged: (value){},
              ),
              const SizedBox(
                height: 10,
              ),
              textSubtitle18Blod('*จำเป็น', ColorTheme().grey50),
              const SizedBox(
                height: 20,
              ),

              const SizedBox(
                height: 40,
              ),
              ButtonGradient(
                btnName: 'ถัดไป',
                onClick: () {
                },
              ),
            ],
          ),
        )
      )
    );
  }
}