import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/dialog/warning_dialog.dart';
import 'package:health_application/ui/base/img_picker/image_picker.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/title_header.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/register_profile/volunteer/bloc/volunteer_register_bloc.dart';
import 'package:health_application/ui/register_profile/volunteer/views/upload_document/upload_preview.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocumentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget hintTextSizedFile() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textSubtitle15w400('รองรับไฟล์ .png .jpg', ColorTheme().grey50),
          textSubtitle15w400('ขนาดไม่เกิน 10 mb', ColorTheme().grey50),
        ],
      );
    }

    bool isCheckAction = false;
    return Scaffold(
        appBar: appBar(
            title: 'โปรไฟล์ของฉัน',
            onBack: () {
              context.read<RegisterProfileBloc>().add(
                  ChangeProfileView(profileType: ProfileType.workInformation));
            }),
        backgroundColor: ColorTheme().white,
        body: StatefulBuilder(builder: (context, setState) {
          return BlocBuilder<VolunteerRegisterBloc, VolunteerRegisterState>(
            builder: (context, state) {
              var doc = state.documentModel;
              var cidDoc = doc.IDCard;
              var cidCoupleDoc = doc.IDCardCouple;
              var volunteerDoc = doc.volunteerCard;
              var volunteerCoupleDoc = doc.volunteerCardCouple;
              return SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          color: ColorTheme().white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textSubtitle18Blod(
                                  'สำเนาบัตรประชาชน', ColorTheme().black87),
                              textSubtitle15w400(
                                  'อัปโหลดรูปบัตรประชาชนและใบหน้าเจ้าของบัตร',
                                  ColorTheme().black87),
                              const SizedBox(
                                height: 20,
                              ),
                              TitleHeaderWidget(
                                title: 'รูปหน้าบัตรประชาชน',
                                isMandatory: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              UploadPreview(
                                title: 'รูปหน้าบัตรประชาชน',
                                image: cidDoc.imgPath,
                                sized: cidDoc.sized,
                                isCheckAction: isCheckAction,
                                delPicture: () async {
                                  await delPictureMethod(context,
                                      type: FormFieldType.uploadCID);
                                },
                                pickPicture: () async {
                                  await pickPictureMethod(context,
                                      type: FormFieldType.uploadCID);
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              hintTextSizedFile(),
                              const SizedBox(
                                height: 20,
                              ),
                              TitleHeaderWidget(
                                title: 'รูปคู่บัตรประชาชน',
                                isMandatory: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              UploadPreview(
                                image: cidCoupleDoc.imgPath,
                                sized: cidCoupleDoc.sized,
                                title: 'รูปคู่บัตรประชาชน',
                                isCheckAction: isCheckAction,
                                delPicture: () async {
                                  await delPictureMethod(context,
                                      type: FormFieldType.uploadCIDCouple);
                                },
                                pickPicture: () async {
                                  await pickPictureMethod(context,
                                      type: FormFieldType.uploadCIDCouple);
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              hintTextSizedFile(),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )),
                      Container(
                          color: ColorTheme().scaffoldGreyBackground,
                          height: 10),
                      Container(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          color: ColorTheme().white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              textSubtitle18Blod(
                                  'สำเนาบัตรจิตอาสา', ColorTheme().black87),
                              textSubtitle15w400(
                                  'อัปโหลดรูปบัตรจิตอาสาและใบหน้าเจ้าของบัตร',
                                  ColorTheme().black87),
                              const SizedBox(
                                height: 20,
                              ),
                              TitleHeaderWidget(
                                title: 'สำเนาบัตรจิตอาสา',
                                isMandatory: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              UploadPreview(
                                image: volunteerDoc.imgPath,
                                sized: volunteerDoc.sized,
                                title: 'สำเนาบัตรจิตอาสา',
                                isCheckAction: isCheckAction,
                                delPicture: () async {
                                  await delPictureMethod(context,
                                      type: FormFieldType.uploadVolunteerCard);
                                },
                                pickPicture: () async {
                                  await pickPictureMethod(context,
                                      type: FormFieldType.uploadVolunteerCard);
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              hintTextSizedFile(),
                              const SizedBox(
                                height: 20,
                              ),
                              TitleHeaderWidget(
                                title: 'รูปคู่บัตรจิตอาสา',
                                isMandatory: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              UploadPreview(
                                image: volunteerCoupleDoc.imgPath,
                                sized: volunteerCoupleDoc.sized,
                                title: 'รูปคู่บัตรจิตอาสา',
                                isCheckAction: isCheckAction,
                                delPicture: () async {
                                  await delPictureMethod(context,
                                      type: FormFieldType
                                          .uploadVolunteerCardCouple);
                                },
                                pickPicture: () async {
                                  await pickPictureMethod(context,
                                      type: FormFieldType
                                          .uploadVolunteerCardCouple);
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              hintTextSizedFile(),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              ButtonGradient(
                                btnName: 'ถัดไป',
                                onClick: () async {
                                  var check = checkMandatoryDocument(
                                      state.documentModel);

                                  if (check) {
                                    context
                                        .read<VolunteerRegisterBloc>()
                                        .add(RegisterProfile());
                                  } else {
                                    await showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            WarningDialog(
                                              header: 'แจ้งเตือน',
                                              subtitle:
                                                  "กรุณากรอกข้อมูลให้ครบถ้วน",
                                              buttonName: 'ตกลง',
                                              onTap: () {},
                                            )) as bool;
                                    setState(
                                      () {
                                        isCheckAction = true;
                                      },
                                    );
                                  }
                                },
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              );
            },
          );
        }));
  }
}
