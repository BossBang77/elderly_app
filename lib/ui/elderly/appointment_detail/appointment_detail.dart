import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/back_button_circle.dart';
import 'package:health_application/ui/base/widget/button_blue_fade.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/elderly/appointment_detail/bloc/appointment_detail_event.dart';
import 'package:health_application/ui/elderly/appointment_detail/bloc/appointment_detail_state.dart';
import 'package:health_application/ui/elderly/appointment_detail/bloc/appointment_detial_bloc.dart';
import 'package:health_application/ui/elderly/appointment_detail/dialog/appointment_approve_dialog.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_common_widget.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail_section/appointment_detail_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_name_section/appointment_name_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_scroll_view.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_user_detail_section/appointment_user_detail_section.dart';
import 'package:health_application/ui/elderly/appointment_detail/page/appointment_page_state.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AppointmentDetailView extends StatefulWidget {
  const AppointmentDetailView();

  // final AppointmetnPageState state;

  @override
  State<StatefulWidget> createState() => _AppointmentDetailViewState();
}

class _AppointmentDetailViewState extends State<AppointmentDetailView> {
  double _scrollOffset = 0;
  // double _headerViewOffset = 0;
  int get _alpha => min(255, max(0, ((_scrollOffset / (MediaQuery.of(context).padding.top + AppBar().preferredSize.height)) * 255).toInt()));

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorTheme().white,
      appBar: AppBar(
        elevation: 0,
        shadowColor: ColorTheme().white,
        backgroundColor: Colors.white.withAlpha(_alpha),
        leading: BackButtonCircleWidget(onClick: () {
          Navigator.pop(context, true);
        }),
        title: Opacity(
          opacity: _alpha / 255,
          child: textSubtitle1('รายละเอียด', ColorTheme().black87),
        ),
        actions: [],
      ),
      body: AppointmentScrollView(
        onScroll: (offset) {
          setState(() {
            _scrollOffset = offset;
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 200),
          padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 30, offset: Offset(0, -4), color: Colors.black.withAlpha(10))],
            color: ColorTheme().scaffoldGreyBackground,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
          ),
          child: BlocBuilder<AppointmentDetailBloc, AppointmentDetailState>(
            builder: (context, state) => 
              state.pageState.body(context, state),
          )
        )
      )
    );
  }
}