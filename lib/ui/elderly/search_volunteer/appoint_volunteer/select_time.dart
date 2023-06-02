import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:http/http.dart';

import '../../../ui-extensions/color.dart';
import '../bloc/search_volunteer_bloc.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
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
          children: List.generate(timeLength.length, (index) {
            var item = timeLength[index];

            return Container(
                margin: EdgeInsets.only(top: 10, right: 10),
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: color.grey10,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: color.GreyBorder)),
                child: textH7(item, color.black87));
          }),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
