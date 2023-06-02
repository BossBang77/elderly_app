import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/elderly/search_volunteer/bloc/search_volunteer_bloc.dart';
import 'package:health_application/ui/elderly/search_volunteer/component/volunteer_card.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

class AllVolunteer extends StatelessWidget {
  const AllVolunteer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textSubtitle18Blod('กิจกรรมทั้งหมด', ColorTheme().black87),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            for (int i = 0; i < 10; i++)
              InkWell(
                  onTap: () {},
                  child: InkWell(
                      onTap: () {
                        context.read<SearchVolunteerBloc>().add(Changeview(
                            view: SearchVolunteerView.volunteerDetail));
                      },
                      child: volunteerCard(context))),
          ],
        )
      ],
    );
  }
}
