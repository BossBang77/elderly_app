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
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart'
    as Register;
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/register_profile/volunteer/model/elderly_profile_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/profile_information/profile_information_bloc.dart';
import 'package:health_application/ui/user_profile/profile_information/view/elderly_field.dart';
import 'package:health_application/ui/user_profile/profile_information/view/image_profile.dart';
import 'package:health_application/ui/user_profile/profile_information/view/request_otp_page.dart';
import 'package:health_application/ui/user_profile/profile_information/view/volunteer_field.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import '../../base/constant/gender_const.dart';
import '../../base/img_picker/image_picker.dart';

class ElderlyProfileInformationView extends StatelessWidget {
  const ElderlyProfileInformationView({required this.profile});
  final RegisterModel profile;

  @override
  Widget build(BuildContext context) {
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
          } else if (state.submitStatus == SubmitStatus.submitSuccess) {
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
              context.read<ProfileInformationBloc>().add(InitialSubmitStatus());
            }
          } else if (state.submitStatus == SubmitStatus.uploadImgFail) {
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
          void volunteerSubmit() {
            if (!checkValidateCitizen(state.profile.profile.citizenId)) {
              context.read<ProfileInformationBloc>().add(SubmitProfile());
            }
          }

          void elderlySubmit() {
            context.read<ProfileInformationBloc>().add(SubmitProfile());
          }

          var elderlyProfile = state.profile;
          bool isVolunteer =
              state.role == Register.RoleType.ROLE_USER_VOLUNTEER.name;
          bool isElderly =
              state.role == Register.RoleType.ROLE_USER_ELDERLY.name;
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
                                  ImageProfile(),
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
                                      onTap: () async {
                                        String phoneNumber = await Navigator.of(
                                                context)
                                            .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    RequestOtpPage(),
                                                settings: RouteSettings(
                                                    name:
                                                        'ElderlyProfileInformationView')));

                                        if (phoneNumber.isNotEmpty) {
                                          context
                                              .read<ProfileInformationBloc>()
                                              .add(ChangePhoneNumber(
                                                  phoneNumber: phoneNumber));
                                        }
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
                                if (isElderly) ElderlyField(),
                                if (isVolunteer) VolunteerField(),
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
                                    if (isVolunteer) {
                                      volunteerSubmit();
                                    } else {
                                      elderlySubmit();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
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
