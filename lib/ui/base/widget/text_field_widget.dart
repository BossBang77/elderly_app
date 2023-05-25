import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:hexcolor/hexcolor.dart';

///text field for customer form
///can use with [TextLabelWidget] only
class TextFieldWidget extends StatelessWidget {
  ///constructor
  const TextFieldWidget(
      {Key? key,
      required this.isEnabled,
      required this.maxLength,
      this.autoValid = false,
      this.suffix = false,
      this.imagePath = '',
      this.errorText = '',
      this.hintText = '',
      this.textNumberType = false,
      this.onTap,
      this.onChanged,
      this.obscureText = false,
      this.mandatory = false,
      this.counterText = false,
      this.textEditingController,
      this.height,
      this.multiLine = false,
      this.setError = false,
      this.hasSpecialChar = true,
      this.setErrorWithOuter = false,
      this.suffixTxt = null,
      this.minLines,
      this.validator,
      this.readOnly = false})
      : super(key: key);

  ///create text field with disable
  TextFieldWidget.disable(
      {required String text,
      String hintText = '',
      double? height,
      bool multiLine = false,
      String? suffixTxt,
      bool suffix = false,
      int? minLines,
      bool obscureText = false})
      : this(
            suffix: suffix,
            suffixTxt: suffixTxt,
            maxLength: 300,
            isEnabled: false,
            readOnly: true,
            hintText: hintText,
            height: height,
            multiLine: multiLine,
            minLines: minLines,
            obscureText: obscureText,
            textEditingController: TextEditingController(text: text));

  ///create text field with disable
  TextFieldWidget.enable(
      {required String text,
      required int maxLength,
      VoidCallback? onTap,
      bool enable = true,
      bool obscureText = false,
      String errorText = '',
      bool autoValid = false,
      bool time = false,
      bool counterText = false,
      bool date = false,
      double? height,
      bool multiLine = false,
      String imagePath = '',
      bool suffix = false,
      bool textNumberType = false,
      String hintText = '',
      bool hasSpecialChar = true,
      bool mandatory = false,
      bool setError = false,
      bool setErrorWithOuter = false,
      bool readOnly = false,
      String? suffixTxt,
      int? minLines,
      FormFieldValidator<String>? validator,
      ValueChanged<String>? onChanged})
      : this(
            readOnly: readOnly,
            onChanged: onChanged,
            maxLength: maxLength,
            autoValid: autoValid,
            isEnabled: enable,
            obscureText: obscureText,
            onTap: onTap,
            textNumberType: textNumberType,
            height: height,
            counterText: counterText,
            suffix: suffix,
            imagePath: imagePath,
            errorText: errorText,
            hintText: hintText,
            mandatory: mandatory,
            multiLine: multiLine,
            setError: setError,
            hasSpecialChar: hasSpecialChar,
            setErrorWithOuter: setErrorWithOuter,
            suffixTxt: suffixTxt,
            validator: validator,
            textEditingController: TextEditingController(text: text),
            minLines: minLines);

  ///error text
  final String errorText;

  ///enabled to editing
  final bool isEnabled;

  ///hint text
  final String hintText;

  ///counterText
  final bool counterText;

  ///max length
  final int maxLength;

  ///max length
  final double? height;

  ///on change
  final ValueChanged<String>? onChanged;

  ///controller
  final TextEditingController? textEditingController;

  ///autoValid
  final bool autoValid;

  ///suffix
  final bool suffix;

  ///imagePath
  final String imagePath;

  ///subTelephoneNumber
  final bool textNumberType;

  ///not mandatory
  final bool mandatory;

  ///multiLine
  final bool multiLine;

  ///obscureText
  final bool obscureText;

  ///hasSpecialChar
  final bool hasSpecialChar;

  ///setError
  final bool setError;

  ///setErrorWithOuter
  final bool setErrorWithOuter;

  final bool readOnly;

  final FormFieldValidator<String>? validator;

  ///onTap
  final VoidCallback? onTap;

  final String? suffixTxt;
  final int? minLines;

  static int _offset = 0;
  int get offset => _offset;
  void setOffset(int offset) {
    _offset = offset;
  }

  @override
  Widget build(BuildContext context) {
    try {
      textEditingController?.selection = TextSelection.fromPosition(
          TextPosition(
              offset: textEditingController!.text.isNotEmpty ? offset : 0));
    } catch (e) {
      textEditingController?.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController!.text.length));
    }
    return Container(
      padding: (setErrorWithOuter)
          ? EdgeInsets.all(0)
          : EdgeInsets.only(left: 20, right: 20),
      height: height,
      decoration: (setErrorWithOuter)
          ? null
          : BoxDecoration(
              color: isEnabled
                  ? ColorTheme().GreyBackGround.withOpacity(0.03)
                  : HexColor('#FBFBFB'),
              border: Border.all(
                  color: (isEnabled)
                      ? ColorTheme().GreyBorder
                      : HexColor('#EFEFEF'),
                  width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
<<<<<<< Updated upstream
      child: TextFormField(
        enabled: isEnabled,
        obscureText: obscureText,
        autovalidateMode: autoValid
            ? AutovalidateMode.always
            : AutovalidateMode.onUserInteraction,
        controller: textEditingController,
        inputFormatters: <TextInputFormatter>[
          if (hasSpecialChar)
            FilteringTextInputFormatter.deny(RegExp(r'[!#^$%*+`~]')),
          if (textNumberType) FilteringTextInputFormatter.digitsOnly
        ],
        maxLength: maxLength,
        minLines: minLines,
        keyboardType: (textNumberType)
            ? const TextInputType.numberWithOptions(decimal: true)
            : (multiLine)
                ? TextInputType.multiline
=======
      child: Center(
        child: TextFormField(
          enabled: isEnabled,
          obscureText: obscureText,
          autovalidateMode: autoValid
              ? AutovalidateMode.always
              : AutovalidateMode.onUserInteraction,
          controller: textEditingController,
          inputFormatters: <TextInputFormatter>[
            if (hasSpecialChar)
              FilteringTextInputFormatter.deny(RegExp(r'[!#^$%*+`~]')),
            if (textNumberType) FilteringTextInputFormatter.digitsOnly
          ],
          maxLength: maxLength,
          minLines: minLines,
          keyboardType: (textNumberType)
              ? const TextInputType.numberWithOptions(decimal: true)
              : (multiLine)
                  ? TextInputType.multiline
                  : null,
          readOnly: readOnly,
          validator: validator ??
              (String? value) {
                if (setError) {
                  return errorText;
                } else {
                  return null;
                }
              },
          onChanged: isEnabled
              ? (value) {
                  var cursorPos = textEditingController?.selection.base.offset;
                  onChanged?.call(value);
                  setOffset(cursorPos ?? 0);
                }
              : null,
          maxLines: multiLine ? null : 1,
          cursorColor: ColorTheme().Primary,
          cursorHeight: 25,
          style: TextStyle(
            color: ColorTheme().black87,
            fontSize: 18.sp,
            fontFamily: fontFamily,
          ),
          decoration: InputDecoration(
            suffixIcon: (suffix)
                ? suffixTxt != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 7, right: 5),
                        child: textOverline2(
                            suffixTxt ?? '', ColorTheme().Primary))
                    : GestureDetector(
                        onTap: onTap,
                        child: Image.asset(
                          imagePath,
                          scale: 5,
                        ),
                      )
>>>>>>> Stashed changes
                : null,
        readOnly: readOnly,
        validator: validator ??
            (String? value) {
              if (setError) {
                return errorText;
              } else {
                return null;
              }
            },
        onChanged: isEnabled
            ? (value) {
                var cursorPos = textEditingController?.selection.base.offset;
                onChanged?.call(value);
                setOffset(cursorPos ?? 0);
              }
            : null,
        maxLines: multiLine ? null : 1,
        decoration: InputDecoration(
          suffixIcon: (suffix)
              ? suffixTxt != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 7, right: 5),
                      child:
                          textOverline2(suffixTxt ?? '', ColorTheme().Primary))
                  : GestureDetector(
                      onTap: onTap,
                      child: Image.asset(
                        imagePath,
                        scale: 5,
                      ),
                    )
              : null,
          errorBorder: (setErrorWithOuter)
              ? OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: ColorTheme().Warning),
                )
              : InputBorder.none,
          counterText: counterText ? null : '',
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintStyle: TextStyle(
            color: ColorTheme().grey50,
            fontSize: 18.sp,
            fontFamily: fontFamily,
          ),
          hintText: hintText,
          filled: setError,
          fillColor: ColorTheme().Warning.withOpacity(0.1),
          focusedBorder: (setErrorWithOuter)
              ? OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: HexColor('#B8B8B8')),
                )
              : InputBorder.none,
          border: (setErrorWithOuter)
              ? OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: HexColor('#B8B8B8')),
                )
              : InputBorder.none,
          disabledBorder: (setErrorWithOuter)
              ? OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: HexColor('#B8B8B8')),
                )
              : InputBorder.none,
          focusedErrorBorder: (setErrorWithOuter)
              ? OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: ColorTheme().Warning),
                )
              : InputBorder.none,
          enabledBorder: (setErrorWithOuter)
              ? OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: HexColor('#B8B8B8')),
                )
              : InputBorder.none,
        ),
      ),
    );
  }
}
