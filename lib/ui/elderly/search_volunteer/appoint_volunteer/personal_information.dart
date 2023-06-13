import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/extension/string_extension.dart';
import 'package:health_application/ui/google_map/googlemap.dart';
import 'package:health_application/ui/google_map/locationsModel.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';

import '../../../base/constant/gender_const.dart';
import '../bloc/search_volunteer_bloc.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;

    return BlocBuilder<SearchVolunteerBloc, SearchVolunteerState>(
      builder: (context, state) {
        var create = state.createAppointment;
        var userProfile = context.read<UserProfileBloc>().state.userProfile;
        var profile = userProfile.profile;

        String getAllCongrnital() {
          String allName = '';
          userProfile.allergicFoods.forEach((element) {
            allName =
                allName + '${allName.isNotEmpty ? ',' : ''}' + element.name;
          });
          return allName;
        }

        String getCongenitalDiseasel() {
          String allName = '';
          userProfile.congenitalDisease.forEach((element) {
            allName =
                allName + '${allName.isNotEmpty ? ',' : ''}' + element.name;
          });
          return allName;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            textSubtitle16Blod('ข้อมูลของคุณ', color.black87),
            const SizedBox(
              height: 10,
            ),
            textSubtitle16Blod('ชื่อ', color.black87),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: sized.width,
              padding: EdgeInsets.all(15),
              decoration: StyleBorder().greyDecoration(radius: 15),
              child: textButton1(profile.name, color.black87),
            ),
            //เบอร์ติดต่อ
            const SizedBox(
              height: 10,
            ),
            textSubtitle16Blod('เบอร์ติดต่อ', color.black87),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: sized.width,
              padding: EdgeInsets.all(15),
              decoration: StyleBorder().greyDecoration(radius: 15),
              child:
                  textButton1(userProfile.username.isNoData(), color.black87),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child:
                        Image.asset('assets/images/person_icon.png', scale: 3)),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 2,
                    child: textButton1(
                        '${Gender.mapToTitle(profile.gender)} (${profile.age} ปี)',
                        color.black87))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: Image.asset('assets/images/board_detail.png',
                        scale: 3)),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 2,
                    child: textButton1(
                        getCongenitalDiseasel().isNoData(), color.black87,
                        maxLines: 10))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: Image.asset('assets/images/board_detail.png',
                        scale: 3)),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 2,
                    child: textButton1(
                        getAllCongrnital().isNoData(), color.black87,
                        maxLines: 10))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(),
            const SizedBox(
              height: 20,
            ),
            textSubtitle16Blod('รายละเอียดเพิ่มเติมถึงจิตอาสา', color.black87),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget.enable(
              text: create.note,
              maxLength: 500,
              multiLine: true,
              minLines: 5,
              hintText: 'รายละเอียดเพิ่มเติม',
              onChanged: (value) {
                context.read<SearchVolunteerBloc>().add(MapCreateAppointment(
                    createObj: CreateAppointObj.note, value: value));
              },
              onFieldSubmitted: () => null,
            ),
            const SizedBox(
              height: 40,
            ),
            Divider(),
            const SizedBox(
              height: 20,
            ),
            textSubtitle16Blod('สถานที่นัดหมาย', color.black87),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GoogleMaps()),
                ).then((value) {
                  Locations _locations = Locations(
                      latitude: userLatiPick,
                      longtitude: userLongtiPick,
                      nameAddress: locationName);
                  context.read<SearchVolunteerBloc>().add(MapCreateAppointment(
                      createObj: CreateAppointObj.address, value: _locations));

                  // TODO integrate
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/location_icon.png',
                      scale: 3,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: textButton1(
                        create.addressFull.isNoData(), color.black87,
                        maxLines: 2),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
