import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';
import 'package:health_application/ui/volunteer/volunteer_information/bloc/volunteer_information_bloc.dart';

import '../../ui-extensions/color.dart';

class VolunteerInformation extends StatelessWidget {
  const VolunteerInformation({super.key, required this.profile});
  final RegisterModel profile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VolunteerInformationBloc()..add(InitialData(profile: profile)),
      child: BlocConsumer<VolunteerInformationBloc, VolunteerInformationState>(
        listener: (context, state) async {
          if (state.statusUpdate == StatusUpdate.success) {
            context.read<VolunteerInformationBloc>().add(ResetStatusUpdate());
            context.go(Routes.home);
          }

          if (state.statusUpdate == StatusUpdate.fail) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertWidget(
                      title: 'เกิดข้อผิดพลาด',
                      subTitle:
                          "มีบางอย่างผิดพลาดในการบันทึก\nกรุณาลองใหม่อีกครั้ง",
                      btnName: 'ตกลง',
                    )) as bool;

            if (acceptClose) {
              context.read<VolunteerInformationBloc>().add(ResetStatusUpdate());
            }
          }
        },
        builder: (context, state) {
          return BlocBuilder<VolunteerInformationBloc,
              VolunteerInformationState>(
            builder: (context, state) {
              var profile = state.profile;
              return Stack(
                children: [
                  Scaffold(
                    appBar: appBar(
                        onBack: () {
                          context.pop();
                        },
                        title: 'ข้อมูลส่วนตัว'),
                    body: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpaceWidget(
                              height: 20,
                            ),
                            textSubtitle18Blod('ข้อมูลจิตอาสา', color.black87),
                            SpaceWidget(
                              height: 20,
                            ),
                            textSubtitle16W500('รหัสจิตอาสา', color.black87),
                            SpaceWidget(
                              height: 10,
                            ),
                            TextFieldWidget.disable(
                              text: profile.volunteerCode.isNoData(),
                            ),
                            SpaceWidget(
                              height: 20,
                            ),
                            textSubtitle16W500(
                                'รหัสเครือข่ายดูแลผู้สูงอายุ', color.black87),
                            SpaceWidget(
                              height: 10,
                            ),
                            TextFieldWidget.enable(
                              text: profile.elderlyCareCode,
                              maxLength: 4,
                              hintText: profile.elderlyCareCode.isNoData(),
                              onChanged: (value) {
                                context.read<VolunteerInformationBloc>().add(
                                    ChangeForm(
                                        type: EditType.elderlyCareCode,
                                        value: value));
                              },
                            ),
                            SpaceWidget(
                              height: 20,
                            ),
                            textSubtitle16W500(
                                'ชื่อเครือข่ายดูแลผู้สูงอายุ', color.black87),
                            SpaceWidget(
                              height: 10,
                            ),
                            TextFieldWidget.enable(
                              text:
                                  'ศูนย์บริการสาธารณสุข 20 บมจ. ธนาคารนครหลวงไทย',
                              maxLength: 100,
                              readOnly: true,
                            ),
                            SpaceWidget(
                              height: 20,
                            ),
                            textSubtitle16W500('ที่อยู่เครือข่ายดูแลผู้สูงอายุ',
                                color.black87),
                            SpaceWidget(
                              height: 10,
                            ),
                            TextFieldWidget.enable(
                              text:
                                  'เลขที่ 257/1 ถนนวิสุทธิ์กษัตริย์ แขวงบางขุนพรหม เขตพระนคร กทม. 10200',
                              maxLength: 100,
                              multiLine: true,
                              readOnly: true,
                            ),
                            SpaceWidget(
                              height: 20,
                            ),
                            textSubtitle16W500('ประสบการณ์', color.black87),
                            SpaceWidget(
                              height: 10,
                            ),
                            TextFieldWidget.enable(
                              text: profile.profile.experience.toString(),
                              maxLength: 2,
                              suffix: true,
                              suffixTxt: 'ปี',
                              textNumberType: true,
                              onChanged: (value) {
                                context.read<VolunteerInformationBloc>().add(
                                    ChangeForm(
                                        type: EditType.experience,
                                        value: value));
                              },
                            ),
                            SpaceWidget(
                              height: 30,
                            ),
                            ButtonGradient(
                              btnName: 'บันทึก',
                              onClick: () {
                                if (profile.elderlyCareCode.isNotEmpty) {
                                  context
                                      .read<VolunteerInformationBloc>()
                                      .add(UpdateVolunteerInformation());
                                }
                              },
                            ),
                            SpaceWidget(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (state.isLoading) Loader()
                ],
              );
            },
          );
        },
      ),
    );
  }
}
