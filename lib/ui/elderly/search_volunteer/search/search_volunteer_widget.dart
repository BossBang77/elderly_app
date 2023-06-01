import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/search_volunteer/bloc/search_volunteer_bloc.dart';
import 'package:health_application/ui/elderly/search_volunteer/filter/filter_volunteer.dart';
import 'package:health_application/ui/elderly/search_volunteer/search/all_volunteer.dart';
import 'package:health_application/ui/elderly/search_volunteer/search/volunteer_recently_search.dart';
import 'package:health_application/ui/home_page/home_page.dart';

import '../../../base/widget/text_field_widget.dart';
import '../../../ui-extensions/color.dart';

class SearchVolunteerWidget extends StatelessWidget {
  const SearchVolunteerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.whiteBackground,
      appBar: appBar(
          onBack: () {
            context
                .read<SearchVolunteerBloc>()
                .add(Changeview(view: SearchVolunteerView.searchSummary));
          },
          title: 'เรียกจิตอาสา',
          showNotification: false),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Flexible(
                  flex: 5,
                  child: TextFieldWidget.enable(
                    text: '',
                    maxLength: 100,
                    hintText: 'ค้นหาจิตอาสา',
                    prefix: true,
                    imagePathPrefix: 'assets/images/search_icon.png',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: InkWell(
                  onTap: () {
                    onFiter(context);
                  },
                  child: Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                        color: color.grey10,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: color.GreyBorder)),
                    child: Image.asset(
                      'assets/images/filter_icon.png',
                      scale: 4,
                    ),
                  ),
                ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            VolunteerRecentlySearched(),
            const SizedBox(
              height: 30,
            ),
            AllVolunteer(),
            const SizedBox(
              height: 100,
            ),
          ]),
        ),
      ),
    );
  }
}
