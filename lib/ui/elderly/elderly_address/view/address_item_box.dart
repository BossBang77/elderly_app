import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/elderly_address/bloc/elderly_address_bloc.dart';
import 'package:health_application/ui/elderly/elderly_address/view/manage_address_elderly.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AddressItemBox extends StatelessWidget {
  const AddressItemBox({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      decoration: StyleBorder().greyDecoration(radius: 15),
      width: sized.width * 0.9,
      // height: sized.height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/location_icon.png',
            scale: 3,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textSubtitle16W500(
                  '3000 ถนนพหลโยธิน แขวงจอมพล เขตจตุจักร กรุงเทพมหานคร 10900',
                  ColorTheme().black87,
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: textBody2('แก้ไข', color.BlueDark2, true),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ManageAddressElderly(
                            type: ManageAddressType.edit)));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
