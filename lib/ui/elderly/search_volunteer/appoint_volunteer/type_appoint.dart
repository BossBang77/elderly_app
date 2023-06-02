import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/elderly/search_volunteer/bloc/search_volunteer_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class TypeOfAppoint extends StatelessWidget {
  const TypeOfAppoint({super.key});

  @override
  Widget build(BuildContext context) {
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
            for (var item in appointType)
              Container(
                  margin: EdgeInsets.only(top: 10, right: 10),
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  decoration: BoxDecoration(
                      color: color.grey10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: color.GreyBorder)),
                  child: textH7(item, color.black87))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
