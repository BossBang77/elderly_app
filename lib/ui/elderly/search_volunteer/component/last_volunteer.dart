import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/appointment_detail/appointment_detail.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../ui-extensions/color.dart';

Widget lastVolunteer(BuildContext context,
    {required VoidCallback onClick, required AppointmentDetail detail}) {
  return InkWell(
    onTap: () {
      onClick();
    },
    child: Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            child: detail.volunteer.image.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    child: Image.network(
                      detail.volunteer.image,
                      scale: 10,
                      fit: BoxFit.cover,
                    ))
                : ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                    child: Image.asset("assets/images/img_notfound.png")),
          ),
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Text(
                    detail.volunteer.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: color.black87,
                      fontSize: 14.sp,
                      fontFamily: fontFamily,
                    ),
                  ),
                ],
              ))
        ],
      ),
    ),
  );
}
