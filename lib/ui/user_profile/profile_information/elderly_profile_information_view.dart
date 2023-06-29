import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/dialog/success_dialog.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/register_profile/volunteer/model/elderly_profile_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/profile_information/profile_information_bloc.dart';
import 'package:health_application/ui/user_profile/profile_information/view/request_otp_page.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import '../../base/constant/gender_const.dart';
import '../../base/img_picker/image_picker.dart';

class ElderlyProfileInformationView extends StatelessWidget {
  const ElderlyProfileInformationView({required this.profile});
  final RegisterModel profile;

  @override
  Widget build(BuildContext context) {
    File file;
    return BlocProvider(
      create: (context) =>
          ProfileInformationBloc()..add(SetIntitalData(profile: profile)),
      child: BlocConsumer<ProfileInformationBloc, ProfileInformationState>(
        listener: (context, state) async {
          if (state.submitStatus == SubmitStatus.submitFail) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertWidget(
                      title: 'เกิดข้อผิดพลาด',
                      subTitle:
                          "มีบางอย่างผิดพลาดในการบันทึกข้อมูล\nกรุณาลองใหม่อีกครั้ง",
                      btnName: 'ตกลง',
                    )) as bool;

            if (acceptClose) {
              context.read<ProfileInformationBloc>().add(InitialSubmitStatus());
            }
          }

          if (state.submitStatus == SubmitStatus.submitSuccess) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => SuccessDialog(
                      header: 'สำเร็จ',
                      subtitle: "บันทึกข้อมูลสำเร็จ",
                      buttonName: 'ตกลง',
                      onTap: () {
                        context.go(Routes.home);
                      },
                    )) as bool;

            if (acceptClose) {
              context.read<UserProfileBloc>().add(GetUserProfile());
              context.read<ProfileInformationBloc>().add(InitialSubmitStatus());
            }
          }
          if (state.submitStatus == SubmitStatus.uploadImgFail) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertWidget(
                      title: 'เกิดข้อผิดพลาด',
                      subTitle:
                          "อัพโหลดรูปโปรไฟล์ไม่สำเร็จ\nกรุณาลองใหม่อีกครั้ง",
                      btnName: 'ตกลง',
                    )) as bool;

            if (acceptClose) {
              context.read<ProfileInformationBloc>().add(InitialSubmitStatus());
            }
          }
        },
        builder: (context, state) {
          var elderlyProfile = state.profile;
          return Scaffold(
            appBar: appBar(
                onBack: () {
                  context.go(
                    Routes.home,
                  );
                },
                title: 'ข้อมูลส่วนตัว'),
            body: Stack(
              children: [
                Container(
                    padding: const EdgeInsets.all(15),
                    child: SafeArea(
                        child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 32,
                                    height: 132.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Gender.isWoman(
                                                elderlyProfile.profile.gender)
                                            ? color.Orange2
                                            : color.BlueDark2,
                                        image: (state.pickedFile != null &&
                                                state.pickedFile!.path
                                                    .isNotEmpty)
                                            ? DecorationImage(
                                                image: FileImage(new File(
                                                    state.pickedFile!.path)),
                                                alignment:
                                                    Alignment.bottomCenter,
                                                fit: BoxFit.cover)
                                            : elderlyProfile
                                                    .profile.image.isNotEmpty
                                                ? DecorationImage(
                                                    image: NetworkImage(
                                                        elderlyProfile
                                                            .profile.image),
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    fit: BoxFit.cover)
                                                : DecorationImage(
                                                    image: AssetImage(
                                                      'assets/images/${Gender.isWoman(elderlyProfile.profile.gender) ? 'woman' : 'man'}_tranparent.png',
                                                    ),
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                  )),
                                  ),
                                  Positioned(
                                      top: 12,
                                      right: 12,
                                      child: GestureDetector(
                                          onTap: () async {
                                            // choose img
                                            PickerFile _pickFile = PickerFile();
                                            await _pickFile.pickImage(context);
                                            await _pickFile.cropImage(context);
                                            context
                                                .read<ProfileInformationBloc>()
                                                .add(UploadImageProfile(
                                                    img:
                                                        _pickFile.pickedFile!));
                                            _pickFile.clear();
                                          },
                                          child: Container(
                                            height: 32,
                                            padding: EdgeInsets.only(
                                              left: 12,
                                              right: 12,
                                            ),
                                            decoration: BoxDecoration(
                                                color:
                                                    Colors.white.withAlpha(100),
                                                borderRadius:
                                                    BorderRadius.circular(32)),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                    'assets/images/camera_icon.png',
                                                    width: 16,
                                                    height: 16),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                textH7('แก้ไข',
                                                    ColorTheme().black87)
                                              ],
                                            ),
                                          )))
                                ]),
                                const SizedBox(
                                  height: 32,
                                ),

                                textSubtitle18Blod(
                                    'ข้อมูลส่วนตัว', ColorTheme().black87),
                                const SizedBox(
                                  height: 20,
                                ),
                                textSubtitle18Blod(
                                    'ชื่อ- นามสกุล', ColorTheme().black87),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFieldWidget.enable(
                                  text: elderlyProfile.profile.name,
                                  maxLength: 100,
                                  hintText: 'ชื่อ- นามสกุล',
                                  onChanged: (value) {
                                    context
                                        .read<ProfileInformationBloc>()
                                        .add(ChangeName(name: value));
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                textSubtitle18Blod(
                                    'เบอร์มือถือของคุณ', ColorTheme().black87),
                                TextFieldWidget.readOnly(
                                  text: elderlyProfile.username,
                                  hintText: 'เบอร์มือถือของคุณ',
                                  suffix: true,
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RequestOtpPage(),
                                                settings: RouteSettings(
                                                    name:
                                                        'ElderlyProfileInformationView')));
                                      },
                                      child: Container(
                                        width: 80,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/edit_enable.png',
                                                width: 18,
                                                height: 18,
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              textSubtitle1('แก้ไข',
                                                  ColorTheme().BlueDark2)
                                            ]),
                                      )),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),

                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textSubtitle18Blod('หน่วยงานที่ดูแล',
                                          ColorTheme().black87),
                                      textSubtitle18Blod(
                                          'ยังไม่ยืนยัน', ColorTheme().DarkRed),
                                    ]),
                                const SizedBox(
                                  height: 20,
                                ),
                                textSubtitle18Blod(
                                    'รหัสหน่วยงาน', ColorTheme().black87),
                                TextFieldWidget.enable(
                                  text: elderlyProfile.elderlyCareCode,
                                  hintText: 'ตัวเลข 4 ตัว',
                                  textNumberType: true,
                                  maxLength: 4,
                                  onChanged: (value) {
                                    context.read<ProfileInformationBloc>().add(
                                        ChangeElderlyCode(elderlyCode: value));
                                  },
                                ),
                                //TODO Pending card EL-299

                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/info.png',
                                        width: 24, height: 24),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        textSubtitle16Blod(
                                          'ข้อมูลเครือข่าย',
                                          ColorTheme().black87,
                                        ),
                                        textSubtitle16Blod(
                                          'ไม่พบข้อมูล',
                                          ColorTheme().black87,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    SizedBox(width: 48),
                                    textSubtitle2(
                                        '', ColorTheme().black87, false),
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                ButtonGradient(
                                  btnName: 'บันทึก',
                                  onClick: () {
                                    context
                                        .read<ProfileInformationBloc>()
                                        .add(SubmitProfile());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Spacer(),
                      ],
                    ))),
                if (state.isLoading) Loader()
              ],
            ),
          );
        },
      ),
    );
  }
}
