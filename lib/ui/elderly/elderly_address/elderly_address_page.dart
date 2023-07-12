import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/elderly_address/bloc/elderly_address_bloc.dart';
import 'package:health_application/ui/elderly/elderly_address/view/address_item_box.dart';
import 'package:health_application/ui/elderly/elderly_address/view/manage_address_elderly.dart';
import 'package:health_application/ui/google_map/cubit/google_map_cubit.dart';
import 'package:health_application/ui/register_profile/model/addresses_detail.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';

import '../../base/routes.dart';

class ElderlyAddressPage extends StatelessWidget {
  const ElderlyAddressPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElderlyAddressBloc()..add(GetProfile()),
      child: BlocConsumer<ElderlyAddressBloc, ElderlyAddressState>(
        listener: (context, state) {},
        builder: (context, state) {
          var listAddress = state.userProfile.addresses;
          return Scaffold(
            backgroundColor: color.white,
            appBar: appBar(
                onBack: () {
                  context.go(Routes.home);
                },
                title: 'ที่อยู่ของคุณ'),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          textSubtitle18Blod(
                              'ที่อยู่ที่บันทึกไว้', ColorTheme().black87,
                              align: TextAlign.start),
                          const SizedBox(
                            height: 20,
                          ),
                          // AddressItemBox()
                          ListView.builder(
                            itemCount: listAddress.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return AddressItemBox(
                                index: index,
                                addressDes: listAddress[index],
                              );
                            },
                          ),

                          Center(
                            child: InkWell(
                              child:
                                  textButton1('+ เพิ่มที่อยู่', color.Orange1),
                              onTap: () {
                                context.read<GoogleMapCubit>().initialState();
                                context.go(Routes.manageAddressElderly, extra: [
                                  ManageAddressType.add,
                                  0,
                                  AddressDetailModel()
                                ]);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state.isLoading) Loader()
              ],
            ),
          );
        },
      ),
    );
  }
}
