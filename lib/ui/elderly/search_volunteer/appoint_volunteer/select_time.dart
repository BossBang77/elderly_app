import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/bloc/master_data_bloc.dart';
import 'package:health_application/ui/base/widget/title_header.dart';
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

        var available = state.avaliableTime.data;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            TitleHeaderWidget(
              title: 'เลือกเวลา',
              isMandatory: true,
            ),
            textH7('กรุณาเลือกเวลา', color.Error),
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

                bool isBusy = available.any((time) =>
                    (time.code == item.keyCode) && time.isAvailable == false);

                return InkWell(
                  onTap: () {
                    if (!isBusy) {
                      CreateAppointObj type =
                          CreateAppointObj.addAppointmentTimes;
                      if (checkIsSelect(item.keyCode)) {
                        type = CreateAppointObj.delAppointmentTimes;
                      }
                      context.read<SearchVolunteerBloc>().add(
                          MapCreateAppointment(
                              createObj: type, value: item.keyCode));
                    }
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 10, right: 10),
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: isBusy
                              ? color.grey10
                              : checkIsSelect(item.keyCode)
                                  ? color.blueText
                                  : color.grey10,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                              color: isBusy
                                  ? color.GreyBorder
                                  : checkIsSelect(item.keyCode)
                                      ? color.blueText
                                      : color.GreyBorder)),
                      child: textH7(
                          item.keyName,
                          isBusy
                              ? color.greyText
                              : checkIsSelect(item.keyCode)
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
