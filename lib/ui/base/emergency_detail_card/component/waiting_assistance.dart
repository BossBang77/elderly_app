import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:health_application/ui/base/emergency_detail_card/bloc/emergency_detail_card_bloc.dart';
import 'package:health_application/ui/base/widget/button_red.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/volunteer/request_assistance_detail/model/submit_assistance.dart';

import '../../../google_map/locationsModel.dart';
import '../../../home_page/bloc/home_page_bloc.dart';
import '../../../ui-extensions/color.dart';
import '../../../volunteer/request_assistance_detail/model/assitance_model.dart';
import '../../../volunteer/request_assistance_detail/request_assitance_detail_page.dart';

class WaitingAssistance extends StatelessWidget {
  const WaitingAssistance({super.key, required this.item});

  final AssitanceDetailModel item;

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    var assistance = item;
    var profile = item.profile;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RequestAssitanceDetailPage(
                      assistanceId: item.id,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color.DarkRed.withOpacity(0.12),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: color.DarkRed)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/silane_red.png',
                  scale: 4,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textSubtitle16Blod('ขอความช่วยเหลือฉุกเฉิน', color.redText),
                    textBody2(profile.name, color.redText, false),
                    Container(
                        width: sized.width * 0.6,
                        child: textBody2(
                            assistance.addressFull, color.redText, false))
                  ],
                ),
              ],
            ),
            Divider(
              color: color.DarkRed,
              thickness: 0.2,
            ),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {
                    context.read<HomePageBloc>().add(ShowLoading());

                    Locations _location = Locations();
                    await _location.getCurrentUserLocation();
                    SubmitAssistance submitMol = SubmitAssistance(
                        addressFull: _location.nameAddress,
                        latitude: _location.latitude,
                        longitude: _location.longtitude,
                        emergencyId: item.id);
                    context
                        .read<EmergencyDetailCardBloc>()
                        .add(AcceptAssistance(submitMol: submitMol));
                    context.read<HomePageBloc>().add(HideLoading());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(maxHeight: 45, minHeight: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: ColorTheme().DarkRed),
                    child: Center(
                      child: textBody2('ช่วยเหลือ', ColorTheme().white, false),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
