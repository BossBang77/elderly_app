import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/base/constant/gender_const.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/profile_information/profile_information_bloc.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart'
    as Register;
import 'package:image_picker/image_picker.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInformationBloc, ProfileInformationState>(
      builder: (context, state) {
        var elderlyProfile = state.profile;
        XFile? file = state.pickedFile;
        String imgLink = elderlyProfile.profile.image;
        Color getColor() {
          return state.role == Register.RoleType.ROLE_USER_ELDERLY.name
              ? Gender.isWoman(elderlyProfile.profile.gender)
                  ? color.Orange2
                  : color.BlueDark2
              : color.BlueFade4;
        }

        DecorationImage getDecorlation() {
          if (file != null && file.path.isNotEmpty) {
            // Case Select new file img
            return DecorationImage(
                image: FileImage(new File(file.path)),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.cover);
          } else if (imgLink.isNotEmpty) {
            //Case display old img from network link
            return DecorationImage(
                image: NetworkImage(imgLink)..evict(),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.cover);
          } else {
            // Case empty image link display defalut img from assets
            return DecorationImage(
              image: AssetImage(
                state.role == Register.RoleType.ROLE_USER_ELDERLY.name
                    ? 'assets/images/${Gender.isWoman(elderlyProfile.profile.gender) ? 'woman' : 'man'}_tranparent.png'
                    : Gender.isWoman(elderlyProfile.profile.gender)
                        ? 'assets/images/volunteer_woman.png'
                        : 'assets/images/volunteer_men.png',
              ),
              alignment: Alignment.bottomCenter,
            );
          }
        }

        return Container(
          width: MediaQuery.of(context).size.width - 32,
          height: 132.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: getColor(),
              image: getDecorlation()),
        );
      },
    );
  }
}
