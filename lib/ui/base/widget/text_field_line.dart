import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

import '../../ui-extensions/font.dart';

class TextFieldLine extends StatelessWidget {
  const TextFieldLine(
      {super.key,
      this.controller,
      this.hintText = '',
      this.onChange,
      this.textNumberType = false,
      this.maxLength = 100});
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChange;
  final bool textNumberType;
  final int maxLength;
  static int _offset = 0;
  int get offset => _offset;
  void setOffset(int offset) {
    _offset = offset;
  }

  @override
  Widget build(BuildContext context) {
    try {
      controller?.selection = TextSelection.fromPosition(
          TextPosition(offset: controller!.text.isNotEmpty ? offset : 0));
    } catch (e) {
      controller?.selection = TextSelection.fromPosition(
          TextPosition(offset: controller!.text.length));
    }
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      onChanged: (String? value) {
        var cursorPos = controller?.selection.base.offset;
        onChange?.call(value ?? '');
        setOffset(cursorPos ?? 0);
      },
      cursorColor: ColorTheme().Primary,
      cursorHeight: 30,
      textAlign: TextAlign.center,
      keyboardType: textNumberType ? TextInputType.number : null,
      inputFormatters: <TextInputFormatter>[
        if (textNumberType) FilteringTextInputFormatter.digitsOnly
      ],
      style: TextStyle(
        color: ColorTheme().black87,
        fontSize: 18.sp,
        fontFamily: fontFamily,
      ),
      decoration: InputDecoration(
          counterText: '',
          errorBorder: InputBorder.none,
          hintStyle: TextStyle(
            color: ColorTheme().grey50,
            fontSize: 18.sp,
            fontFamily: fontFamily,
          ),
          hintText: hintText,
          fillColor: ColorTheme().Warning.withOpacity(0.1),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorTheme().Blue, width: 1.5),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorTheme().Blue, width: 1.5),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorTheme().Blue, width: 1.5),
          )),
    );
  }
}
