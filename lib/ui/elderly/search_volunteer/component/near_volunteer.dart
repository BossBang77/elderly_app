import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../ui-extensions/color.dart';

Widget nearVolunteer(BuildContext context) {
  var sized = MediaQuery.of(context).size;
  return Container(
    width: sized.width * 0.35,
    margin: EdgeInsets.only(right: 15),
    child: Column(
      children: [
        Container(
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
              child: Image.asset("assets/images/example_volunteer.png")),
        ),
        Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'นางวิมลรัตน์ มงคลจิต',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: color.black87,
                    fontSize: 14.sp,
                    fontFamily: fontFamily,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/icon_star_point.png',
                      scale: 4,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    textButton2('4.2 (34)', color.greyText)
                  ],
                )
              ],
            ))
      ],
    ),
  );
}
