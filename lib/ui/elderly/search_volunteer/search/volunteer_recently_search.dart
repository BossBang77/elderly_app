import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/search_volunteer/bloc/search_volunteer_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class VolunteerRecentlySearched extends StatelessWidget {
  const VolunteerRecentlySearched({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchVolunteerBloc, SearchVolunteerState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textSubtitle18Blod('รายการที่ค้นหาล่าสุด', ColorTheme().black87),
            if (state.recentlyList.isEmpty) ...{
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 20),
                child: textSubtitle15w400(
                  'ไม่พบรายการค้นหาล่าสุด',
                  color.grey50,
                ),
              )
            },
            Wrap(
              children: [
                for (var item in state.recentlyList)
                  InkWell(
                    onTap: () {
                      context
                          .read<SearchVolunteerBloc>()
                          .add(OnFilter(type: FilterType.keyword, value: item));
                      var master = state.searchVolunteer;
                      master = master.copyWith(keyword: item);

                      context
                          .read<SearchVolunteerBloc>()
                          .add(SearchVolunteer(search: master));
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 10, right: 10),
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        decoration: BoxDecoration(
                            color: color.grey10,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: color.GreyBorder)),
                        child: textSubtitle16Blod(item, color.BlueDark)),
                  )
              ],
            )
          ],
        );
      },
    );
  }
}
