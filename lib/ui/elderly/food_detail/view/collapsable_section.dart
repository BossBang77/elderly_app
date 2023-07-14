import 'package:flutter/material.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class CollapsableSection extends StatefulWidget {
  const CollapsableSection(
      {required this.sectionHeaderTitle,
      required this.child,
      this.iconImagePath = ''});

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
    bool isShow = true;
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: ColorTheme().GreyBorder,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                setState(
                  () {
                    isShow = !isShow;
                  },
                );
              },
              child: Container(
                margin: isShow ? EdgeInsets.only(bottom: 16) : null,
                child: Row(children: [
                  //icon
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: Image.asset(widget.iconImagePath),
                  ),
                  SizedBox(width: 10),
                  textSubtitle1(
                      widget.sectionHeaderTitle, ColorTheme().black87),
                  Spacer(),
                  //dropdown icon
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: isShow
                        ? Image.asset('assets/images/dropdown_arrow_icon.png')
                        : Image.asset(
                            'assets/images/icon_arrow_down.png',
                            scale: 2.5,
                          ),
                  )
                ]),
              ),
            ),
            if (isShow) ...{
              Container(height: 1, color: ColorTheme().greybackground5),
              SizedBox(height: 16),
              _isExpand ? widget.child : Container()
            }
          ],
        ),
      );
    });
  }
}
