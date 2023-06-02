import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

import '../../base/widget/text_field_line.dart';

Widget SelectHeightWidget(BuildContext context, RegisterProfileState state) {
  var profile = state.registerModel.profile;
  return Column(
    children: [
      Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(child: textSubtitle24('ส่วนสูงของฉัน', ColorTheme().black87)),
          const SizedBox(
            height: 30,
          ),
          TextFieldLine(
            controller: TextEditingController(
                text: profile.height != 0 ? profile.height.toString() : ''),
            textNumberType: true,
            maxLength: 3,
            hintText: 'ส่วนสูงของฉัน',
            onChange: ((value) {
              context.read<RegisterProfileBloc>().add(FormFillType(
                    type: FillType.heightDetail,
                    value: int.tryParse(value) ?? 0,
                  ));
            }),
          ),
          const SizedBox(
            height: 30,
          ),
          textSubtitle16Blod('เซนติเมตร (ซม.)', ColorTheme().black87),
        ],
      ),
    ],
  );
}
