import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_application/ui/base/dialog/accept_two_condition_dialog.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/elderly/elderly_address/bloc/elderly_address_bloc.dart';
import 'package:health_application/ui/elderly/elderly_address/elderly_address_page.dart';
import 'package:health_application/ui/elderly/elderly_address/model/location_model.dart';
import 'package:health_application/ui/elderly/elderly_address/view/map_location.dart';
import 'package:health_application/ui/google_map/googlemap.dart';
import 'package:health_application/ui/google_map/locationsModel.dart';
import 'package:health_application/ui/register_profile/model/addresses_detail.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';

import '../../../base/routes.dart';

class ManageAddressElderly extends StatelessWidget {
  const ManageAddressElderly(
      {super.key,
      required this.type,
      this.index = 0,
      this.addressDes = const AddressDetailModel()});

  final ManageAddressType type;
  final int index;
  final AddressDetailModel addressDes;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElderlyAddressBloc()
        ..add(GetProfile())
        ..add(LocationChange(
            type: type,
            location: LocationModel(
                latitude: addressDes.latitude,
                longitude: addressDes.longitude,
                locationName: addressDes.fullAddress))),
      child: BlocConsumer<ElderlyAddressBloc, ElderlyAddressState>(
        listener: (context, state) async {
          if (state.addressState == ChangeAddressState.changeAddressFail) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertWidget(
                      title: 'เกิดข้อผิดพลาด',
                      subTitle: "บันทึกข้อมูลไม่สำเร็จ\nกรุณาลองใหม่อีกครั้ง",
                      btnName: 'ตกลง',
                    )) as bool;

            if (acceptClose) {
              context.read<ElderlyAddressBloc>().add(ResetState());
            }
          }
          if (state.addressState == ChangeAddressState.changeAddressSuccess) {
            context.read<ElderlyAddressBloc>().add(ResetState());
            context.go(Routes.elderlyAddress);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                backgroundColor: color.white,
                appBar: appBar(
                    onBack: () {
                      context.go(Routes.elderlyAddress);
                    },
                    images: 'assets/images/exit_icon.png',
                    title: type == ManageAddressType.add
                        ? 'เพิ่มที่อยู่'
                        : 'แก้ไขที่อยู่',
                    suffixAction: type == ManageAddressType.edit
                        ? InkWell(
                            onTap: () async {
                              final bool acceptClose = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AcceptTwoCondition(
                                        header: 'ลบที่อยู่',
                                        subtitle:
                                            'คุณต้องการลบที่อยู่นี้ใช่หรือไม่',
                                        btnAcceptName: "ใช่ ลบที่อยู่นี้",
                                      )) as bool;

                              if (acceptClose) {
                                context.read<ElderlyAddressBloc>().add(
                                    onAcceptLocation(
                                        type: ManageAddressType.delete,
                                        index: index));
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 14, 15, 0),
                              child: textSubtitle16Blod(
                                  'ลบออก', ColorTheme().Blue2),
                            ),
                          )
                        : const SizedBox()),
                body: Stack(
                  children: [
                    Container(child: MapLocation(latLng: state.location)),
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
                                  child: textButton2(
                                      state.location.locationName,
                                      ColorTheme().black87,
                                      maxline: 2),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ButtonGradient(
                                  btnName: "ยืนยัน",
                                  onClick: () {
                                    context.read<ElderlyAddressBloc>().add(
                                        onAcceptLocation(
                                            type: type, index: index));
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
                ),
              ),
              if (state.isLoading) Loader()
            ],
          );
        },
      ),
    );
  }
}
