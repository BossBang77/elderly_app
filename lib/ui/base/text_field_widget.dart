import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui-extensions/color.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {Key? key,
      this.textEditingController,
      this.textAlign = TextAlign.start,
      this.textInputAction = TextInputAction.done,
      this.keyboardType,
      this.valueChanged,
      this.labelText = ''})
      : super(key: key);

  TextEditingController? textEditingController;
  TextAlign textAlign;
  TextInputAction textInputAction;
  TextInputType? keyboardType;
  ValueChanged<String>? valueChanged;

  String labelText;
  static int _offset = 0;
  int get offset => _offset;
  void setOffset(int offset) {
    _offset = offset;
  }

  @override
  Widget build(BuildContext context) {
    InputBorder? border = UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: ColorTheme().OnBackground1,
      ),
    );
    var text = textEditingController?.text;
    try {
      textEditingController?.selection = TextSelection.fromPosition(
          TextPosition(offset: text!.isNotEmpty ? offset : 0));
    } catch (e) {
      textEditingController?.selection =
          TextSelection.fromPosition(TextPosition(offset: text!.length));
    }

    return TextField(
      controller: textEditingController,
      textAlign: textAlign,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onChanged: (value) {
        valueChanged!.call(value);
        var cursorPos = textEditingController?.selection.base.offset;

        setOffset(cursorPos ?? 0);
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: border,
          filled: false,
          focusedBorder: border,
          enabledBorder: border,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: labelText,
          labelStyle: TextStyle(
            color: ColorTheme().OnBackground1,
            fontSize: 12.sp,
            fontFamily: 'Mitr',
            fontWeight: FontWeight.w300,
          )),
    );
  }
}
