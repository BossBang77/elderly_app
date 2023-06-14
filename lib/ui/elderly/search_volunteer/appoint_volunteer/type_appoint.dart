import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/search_volunteer/bloc/search_volunteer_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../base/bloc/master_data_bloc.dart';

class TypeOfAppoint extends StatelessWidget {
  const TypeOfAppoint({super.key});

  @override
  Widget build(BuildContext context) {
    var appointTypeList =
        context.read<MasterDataBloc>().state.appointmentType.data;
    return BlocBuilder<SearchVolunteerBloc, SearchVolunteerState>(
      builder: (context, state) {
        var typeList = state.createAppointment.types;

        bool checkIsSelect(String code) {
          return typeList.any((item) => item.code == code);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            textSubtitle16Blod('ประเภทการนัดหมาย', color.black87),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                for (var item in appointTypeList)
                  InkWell(
                    onTap: () {
                      CreateAppointObj type = CreateAppointObj.addType;
                      if (checkIsSelect(item.keyCode)) {
                        type = CreateAppointObj.delType;
                      }
                      context.read<SearchVolunteerBloc>().add(
                          MapCreateAppointment(
                              createObj: type, value: item.keyCode));
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 10, right: 10),
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        decoration: BoxDecoration(
                            color: checkIsSelect(item.keyCode)
                                ? color.blueText
                                : color.grey10,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                                color: checkIsSelect(item.keyCode)
                                    ? color.blueText
                                    : color.GreyBorder)),
                        child: textH7(
                            item.keyName,
                            checkIsSelect(item.keyCode)
                                ? color.white
                                : color.black87)),
                  )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
