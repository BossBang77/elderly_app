import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class CollapsableSection extends StatefulWidget {
  const CollapsableSection({required this.sectionHeaderTitle, required this.child, this.iconImagePath = ''});

  final String sectionHeaderTitle;
  final Widget child;
  final String iconImagePath;

  @override
  State<StatefulWidget> createState() => _CollapsableSectionState();
}

class _CollapsableSectionState extends State<CollapsableSection> {
  bool _isExpand = true;

  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorTheme().GreyBorder,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                //icon
                SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset(widget.iconImagePath),
                ),
                SizedBox(width: 10),
                textSubtitle1(widget.sectionHeaderTitle, ColorTheme().black87),
                Spacer(),
                //dropdown icon
                SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('assets/images/dropdown_arrow_icon.png'),
                )
              ]
            ),
          ),
          
          Container(height: 1, color: ColorTheme().greybackground5),
          SizedBox(height: 16),

          _isExpand ? widget.child : Container()
        ],
      ),
    );
  }
}