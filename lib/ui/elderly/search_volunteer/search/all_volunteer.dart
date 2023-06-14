import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/search_volunteer/bloc/search_volunteer_bloc.dart';
import 'package:health_application/ui/elderly/search_volunteer/component/volunteer_card.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

class AllVolunteer extends StatelessWidget {
  const AllVolunteer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchVolunteerBloc, SearchVolunteerState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textSubtitle18Blod('จิตอาสาทั้งหมด', ColorTheme().black87),
            const SizedBox(
              height: 10,
            ),
            if (state.searchRes.data.isEmpty) ...{
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: textSubtitle16Blod('ไม่พบข้อมูล', color.greyText)),
                ],
              )
            },
            Column(
              children: [
                for (int i = 0; i < state.searchRes.data.length; i++)
                  InkWell(
                      onTap: () {
                        context.read<SearchVolunteerBloc>().add(
                            GetDetailVolunteer(
                                id: state.searchRes.data[i].profileId));
                      },
                      child: volunteerCard(context, state.searchRes.data[i])),
              ],
            )
          ],
        );
      },
    );
  }
}
