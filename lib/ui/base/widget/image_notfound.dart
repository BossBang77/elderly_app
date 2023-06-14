import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageNotFound extends StatelessWidget {
  const ImageNotFound({super.key, this.scale = 1});
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/img_notfound.png',
        scale: scale,
      ),
    );
  }
}
