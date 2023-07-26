import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/image_notfound.dart';
import 'package:health_application/ui/extension/string_extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../model/volunteer_detail_search.dart';

Widget volunteerCard(BuildContext context, VolunteerDetailSearch item) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: item.image.isNotEmpty
                      ? Image.network(
                          item.image,
                          fit: BoxFit.cover,
                          height: 75,
                          width: 75,
                        )
                      : ImageNotFound()),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textButton1(item.name.isNoData(), color.black87),
                textButton2(item.elderlyCareName.isNoData(), color.greyText),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icon_star_point.png',
                        scale: 4,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      textButton2('${item.rating}', color.greyText),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      Divider(),
      const SizedBox(
        height: 5,
      ),
    ],
  );
}
