import 'package:flutter/material.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

Widget SelectGenderWidget(BuildContext context, RegisterProfileState state) {
  return Column(
    children: [
      Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(child: textSubtitle24('ฉันเป็น...', ColorTheme().black87)),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context
                          .read<RegisterProfileBloc>()
                          .add(SelectGender(gender: Gender.male));
                    },
                    child: Image.asset(
                      state.gender == Gender.male
                          ? 'assets/images/man_active.png'
                          : 'assets/images/man_inactive.png',
                      scale: 4,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textSubtitle16Blod('ผู้ชาย', ColorTheme().black87),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context
                          .read<RegisterProfileBloc>()
                          .add(SelectGender(gender: Gender.female));
                    },
                    child: Image.asset(
                      state.gender == Gender.female
                          ? 'assets/images/woman_active.png'
                          : 'assets/images/woman_inactive.png',
                      scale: 4,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textSubtitle16Blod('ผู้หญิง', ColorTheme().black87),
                ],
              ),
            ],
          )
        ],
      ),
    ],
  );
}
