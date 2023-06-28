import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/elderly_address/bloc/elderly_address_bloc.dart';
import 'package:health_application/ui/elderly/elderly_address/view/address_item_box.dart';
import 'package:health_application/ui/elderly/elderly_address/view/manage_address_elderly.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ElderlyAddressPage extends StatelessWidget {
  const ElderlyAddressPage({super.key, required this.profile});
  final RegisterModel profile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElderlyAddressBloc(),
      child: BlocConsumer<ElderlyAddressBloc, ElderlyAddressState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: color.white,
            appBar: appBar(
                onBack: () {
                  Navigator.pop(context);
                },
                title: 'ที่อยู่ของคุณ'),
            body: Padding(
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
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return AddressItemBox();
                        },
                      ),

                      Center(
                        child: InkWell(
                          child: textButton1('+ เพิ่มที่อยู่', color.Orange1),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ManageAddressElderly(
                                    type: ManageAddressType.add)));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
