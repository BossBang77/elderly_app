import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/widget/image_notfound.dart';

import '../../ui-extensions/color.dart';

class PageScroll extends StatelessWidget {
  const PageScroll(
      {super.key,
      required this.child,
      this.imgPath = '',
      this.leading,
      this.isNetWork = false,
      this.bgColor});
  final Widget child;
  final String imgPath;
  final Widget? leading;
  final bool isNetWork;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          stretch: true,
          backgroundColor: bgColor ?? ColorTheme().BlueFade2.withOpacity(0.1),
          expandedHeight: 250,
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: leading ?? Container(),
          ),
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [],
            background: Container(
              height: sized.height,
              child: imgPath.isNotEmpty
                  ? isNetWork
                      ? Image.network(
                          imgPath,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          imgPath,
                          scale: 2,
                        )
                  : ImageNotFound(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([child]),
        ),
      ],
    );
  }
}
