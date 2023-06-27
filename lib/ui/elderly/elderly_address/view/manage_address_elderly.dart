import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/elderly/elderly_address/bloc/elderly_address_bloc.dart';
import 'package:health_application/ui/elderly/elderly_address/model/location_model.dart';
import 'package:health_application/ui/elderly/elderly_address/view/map_location.dart';
import 'package:health_application/ui/google_map/googlemap.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ManageAddressElderly extends StatelessWidget {
  const ManageAddressElderly({super.key, required this.type});

  final ManageAddressType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.white,
        appBar: appBar(
            onBack: () {
              Navigator.pop(context);
            },
            images: 'assets/images/exit_icon.png',
            title:
                type == ManageAddressType.add ? 'เพิ่มที่อยู่' : 'แก้ไขที่อยู่',
            suffixAction: type == ManageAddressType.edit
                ? InkWell(
                    onTap: () async {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 15, 0),
                      child: textSubtitle16Blod('ลบออก', ColorTheme().Blue2),
                    ),
                  )
                : const SizedBox()),
        body: BlocConsumer<ElderlyAddressBloc, ElderlyAddressState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: MapLocation(
                    onAccept: (LocationModel locate) {
                      context
                          .read<ElderlyAddressBloc>()
                          .add(LocationChange(location: locate));
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 250.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: color.GreyBorder)),
                    padding: EdgeInsets.only(
                        bottom: 12.0.h, top: 12.h, left: 12.w, right: 12.w),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: textSubtitle16W500(
                                'ที่อยู่ของคุณ',
                                ColorTheme().black87,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: textButton2(state.location.locationName,
                                  ColorTheme().black87,
                                  maxline: 2),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            ButtonGradient(
                              btnName: "ยืนยัน",
                              onClick: () {
                                context
                                    .read<ElderlyAddressBloc>()
                                    .add(onAcceptLocation());
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
