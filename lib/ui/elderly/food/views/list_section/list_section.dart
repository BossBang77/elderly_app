import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ListSection extends StatelessWidget {
  const ListSection(
      {this.children = const [], this.sectionHeaderTitle = '', this.padding});

  final List<Widget> children;
  final String sectionHeaderTitle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
            Container(
              padding: padding ?? EdgeInsets.all(16),
              child:
                  textSubtitle18Blod(sectionHeaderTitle, ColorTheme().black87),
            ),
            if (children.isEmpty)
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 20),
                child: textSubtitle1(
                  'ไม่พบรายการอาหาร',
                  color.grey50,
                ),
              )
          ] +
          children,
    );
  }
}
