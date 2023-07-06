import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/base/constant/gender_const.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/profile_information/profile_information_bloc.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart'
    as Register;

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInformationBloc, ProfileInformationState>(
      builder: (context, state) {
        var elderlyProfile = state.profile;
        return Container(
          width: MediaQuery.of(context).size.width - 32,
          height: 132.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: state.role == Register.RoleType.ROLE_USER_ELDERLY.name
                  ? Gender.isWoman(elderlyProfile.profile.gender)
                      ? color.Orange2
                      : color.BlueDark2
                  : color.BlueFade4,
              image: (state.pickedFile != null &&
                      state.pickedFile!.path.isNotEmpty)
                  ? DecorationImage(
                      image: FileImage(new File(state.pickedFile!.path)),
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.cover)
                  : elderlyProfile.profile.image.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(elderlyProfile.profile.image),
                          alignment: Alignment.bottomCenter,
                          fit: BoxFit.cover)
                      : DecorationImage(
                          image: AssetImage(
                            state.role ==
                                    Register.RoleType.ROLE_USER_ELDERLY.name
                                ? 'assets/images/${Gender.isWoman(elderlyProfile.profile.gender) ? 'woman' : 'man'}_tranparent.png'
                                : Gender.isWoman(elderlyProfile.profile.gender)
                                    ? 'assets/images/volunteer_woman.png'
                                    : 'assets/images/volunteer_men.png',
                          ),
                          alignment: Alignment.bottomCenter,
                        )),
        );
      },
    );
  }
}
