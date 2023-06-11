import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/back_button_circle.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AppointmentScrollView extends StatefulWidget {
  const AppointmentScrollView({
    required this.child,
    this.onScroll
  });

  final Widget child;
  final Function(double)? onScroll;
  @override
  State<StatefulWidget> createState() => _AppointmentScrollViewState();
}

class _AppointmentScrollViewState extends State<AppointmentScrollView> {
  double _scrollOffset = 0;
  int get _alpha => min(255, max(0, ((_scrollOffset / (MediaQuery.of(context).padding.top + AppBar().preferredSize.height)) * 255).toInt()));
  
  @override 
  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme().white,
      child: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/appointment_detail_bg.png'),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      widget.onScroll?.call(notification.metrics.pixels);
                      return true;
                    },
                    child: SingleChildScrollView(
                      child: widget.child
                    )
                  )
                ),
              ],
            )
          )
        ]
      )
    );
  }
}