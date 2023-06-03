import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/search_volunteer/appoint_volunteer/appoint_volunteer_widget.dart';
import 'package:health_application/ui/elderly/search_volunteer/search/search_volunteer_widget.dart';
import 'package:health_application/ui/elderly/search_volunteer/volunteer_detail/volunteer_detail.dart';
import 'package:health_application/ui/elderly/search_volunteer/volunteer_widget.dart';

import 'bloc/search_volunteer_bloc.dart';

class VolunteerPage extends StatelessWidget {
  const VolunteerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchVolunteerBloc>(
      create: (_) => SearchVolunteerBloc(),
      child: BlocConsumer<SearchVolunteerBloc, SearchVolunteerState>(
          listener: (context, state) {},
          builder: (BuildContext parent, SearchVolunteerState state) {
            if (state.searchVolunteerView ==
                SearchVolunteerView.searchSummary) {
              return VolunteerWidget();
            } else if (state.searchVolunteerView ==
                SearchVolunteerView.searchResult) {
              return SearchVolunteerWidget();
            } else if (state.searchVolunteerView ==
                SearchVolunteerView.volunteerDetail) {
              return VolunteerDetailWidget();
            } else if (state.searchVolunteerView ==
                SearchVolunteerView.AppointVolunteer) {
              return AppointVolunteerWidget();
            } else {
              return Container();
            }
          }),
    );
  }
}
