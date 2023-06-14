import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/bloc/master_data_bloc.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:http/http.dart';

import '../../../ui-extensions/color.dart';
import '../bloc/search_volunteer_bloc.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({super.key});

  @override
  Widget build(BuildContext context) {
    var timeList = context.read<MasterDataBloc>().state.appointmentTime.data;
    var sized = MediaQuery.of(context).size;
    return BlocBuilder<SearchVolunteerBloc, SearchVolunteerState>(
      builder: (context, state) {
        var time = state.createAppointment.appointmentTimes;
        bool checkIsSelect(String code) {
          return time.any((item) => item.code == code);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            textSubtitle16Blod('เลือกเวลา', color.black87),
            textH7('เลือกได้มากกว่า 1 ช่วงเวลา', color.greyText),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              mainAxisSpacing: 2, // ช่องว่างแนวนอน
              crossAxisSpacing: 1, // ช่องว่างแนวตั้ง
              crossAxisCount: 2,
              childAspectRatio: 3.7,
              children: List.generate(timeList.length, (index) {
                var item = timeList[index];

                return InkWell(
                  onTap: () {
                    CreateAppointObj type =
                        CreateAppointObj.addAppointmentTimes;
                    if (checkIsSelect(item.keyCode)) {
                      type = CreateAppointObj.delAppointmentTimes;
                    }
                    context.read<SearchVolunteerBloc>().add(
                        MapCreateAppointment(
                            createObj: type, value: item.keyCode));
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 10, right: 10),
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      alignment: Alignment.center,
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
                );
              }),
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
