import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

import '../../base/widget/text_field_line.dart';

Widget SelectWeigthWidget(BuildContext context, RegisterProfileState state) {
  var profile = state.registerModel.profile;
  return Column(
    children: [
      Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(child: textSubtitle24('น้ำหนักของฉัน', ColorTheme().black87)),
          const SizedBox(
            height: 30,
          ),
          TextFieldLine(
            controller: TextEditingController(
                text: profile.weight != 0 ? profile.weight.toString() : ''),
            textNumberType: true,
            maxLength: 2,
            hintText: 'น้ำหนักของฉัน',
            onChange: ((value) {
              context.read<RegisterProfileBloc>().add(FormFillType(
                    type: FillType.weightDetail,
                    value: int.tryParse(value) ?? 0,
                  ));
            }),
          ),
          const SizedBox(
            height: 30,
          ),
          textSubtitle16Blod('กิโลกรัม (กก.)', ColorTheme().black87),
        ],
      ),
    ],
  );
}
