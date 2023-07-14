import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/register_profile/model/addresses_detail.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/volunteer/volunteer_address/bloc/volunteer_address_bloc.dart';

import '../../../ui-extensions/color.dart';

class AddressCard extends StatelessWidget {
  const AddressCard(
      {super.key,
      required this.type,
      required this.onTap,
      required this.isNotEmptyAddress,
      required this.addressDetail});
  final AddressType type;
  final Function()? onTap;
  final bool isNotEmptyAddress;
  final AddressDetailModel addressDetail;

  @override
  Widget build(BuildContext context) {
    String getImagePath() {
      if (type == AddressType.CONTACT_ADDRESS) {
        return 'assets/images/location_address_icon.png';
      } else {
        return 'assets/images/home_address_icon.png';
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                getImagePath(),
                scale: 3,
                color: color.black87,
              ),
              SpaceWidget(
                width: 10,
              ),
              textSubtitle18Blod(type.title, color.black87)
            ],
          ),
          SpaceWidget(
            height: 10,
          ),
          isNotEmptyAddress
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                  decoration: StyleBorder().greyDecoration(radius: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textSubtitle16W500(
                            addressDetail.fullAddressWithPrefix, color.black87),
                        SpaceWidget(
                          height: 10,
                        ),
                        InkWell(
                            onTap: onTap,
                            child: textSubtitle16W500('แก้ไข', color.blueText,
                                underline: true))
                      ]),
                )
              : Center(
                  child: InkWell(
                    child: textButton1('+ เพิ่มที่อยู่', color.Orange1),
                    onTap: onTap,
                  ),
                ),
        ],
      ),
    );
  }
}
