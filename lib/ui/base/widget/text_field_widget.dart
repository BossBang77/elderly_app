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
      this.readOnly = false,
      this.imagePathPrefix = '',
      this.prefix = false,
      this.prefixTxt,
      this.textInputAction = null,
      this.onFieldSubmitted,
      this.focusNode = null,
      this.suffixIcon = null,
      this.textAlign = TextAlign.left})
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
      bool obscureText = false,
      Widget? suffixIcon = null})
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
            suffixIcon: suffixIcon,
            textEditingController: TextEditingController(text: text));

  ///create text field with disable
  TextFieldWidget.readOnly(
      {required String text,
      String hintText = '',
      double? height,
      bool multiLine = false,
      String? suffixTxt,
      bool suffix = false,
      int? minLines,
      bool obscureText = false,
      Widget? suffixIcon = null})
      : this(
            suffix: suffix,
            suffixTxt: suffixTxt,
            maxLength: 300,
            isEnabled: true,
            readOnly: true,
            hintText: hintText,
            height: height,
            multiLine: multiLine,
            minLines: minLines,
            obscureText: obscureText,
            suffixIcon: suffixIcon,
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
      Widget? suffixIcon = null,
      int? minLines,
      String? prefixTxt,
      bool prefix = false,
      String imagePathPrefix = '',
      FormFieldValidator<String>? validator,
      ValueChanged<String>? onChanged,
      TextInputAction? textInputAction,
      TextEditingController? textEditingController,
      FocusNode? focusNode,
      VoidCallback? onFieldSubmitted,
      TextAlign textAlign = TextAlign.left})
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
            textEditingController:
                textEditingController ?? TextEditingController(text: text),
            minLines: minLines,
            prefix: prefix,
            prefixTxt: prefixTxt,
            imagePathPrefix: imagePathPrefix,
            textInputAction: textInputAction,
            suffixIcon: suffixIcon,
            onFieldSubmitted: onFieldSubmitted,
            focusNode: focusNode,
            textAlign: textAlign);

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

  final Widget? suffixIcon;

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

  final FocusNode? focusNode;

  final TextAlign textAlign;

  final String? suffixTxt;
  final int? minLines;
  final bool prefix;
  final String? prefixTxt;
  final String imagePathPrefix;
  final TextInputAction? textInputAction;
  final VoidCallback? onFieldSubmitted;

  static int _offset = 0;
  int get offset => _offset;
  void setOffset(int offset) {
    _offset = offset;
  }

  String getErrorText() {
    if (setError) {
      return errorText;
    } else {
      return '';
    }
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          height: height,
          decoration: BoxDecoration(
              color: setErrorWithOuter
                  ? color.Error.withOpacity(0.2)
                  : isEnabled
                      ? ColorTheme().GreyBackGround.withOpacity(0.03)
                      : ColorTheme().GreyBackGround,
              border: Border.all(
                  color: setErrorWithOuter
                      ? color.Error
                      : (isEnabled)
                          ? ColorTheme().GreyBorder
                          : ColorTheme().GreyBorder,
                  width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
            child: TextFormField(
              textAlign: textAlign,
              focusNode: focusNode,
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
              keyboardType: (multiLine) ? TextInputType.multiline : null,
              readOnly: readOnly,
              textInputAction: textInputAction ?? TextInputAction.done,
              onChanged: isEnabled
                  ? (value) {
                      var cursorPos =
                          textEditingController?.selection.base.offset;
                      onChanged?.call(value);
                      setOffset(cursorPos ?? 0);
                    }
                  : null,
              onFieldSubmitted: (value) {
                if (onFieldSubmitted != null) onFieldSubmitted!();
              },
              maxLines: multiLine ? null : 1,
              cursorColor: ColorTheme().Primary,
              cursorHeight: 25,
              style: TextStyle(
                color: ColorTheme().black87,
                fontSize: 18.sp,
                fontFamily: fontFamily,
              ),
              decoration: InputDecoration(
                prefixIcon: (prefix)
                    ? prefixTxt != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 7, right: 5),
                            child: textOverline2(
                                prefixTxt ?? '', ColorTheme().Primary))
                        : GestureDetector(
                            onTap: onTap,
                            child: Image.asset(
                              imagePathPrefix,
                              scale: 5,
                            ),
                          )
                    : null,
                suffixIcon: (suffix)
                    ? suffixIcon != null
                        ? suffixIcon
                        : suffixTxt != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, right: 5),
                                child: textSubtitle16Blod(
                                    suffixTxt ?? '', Colors.grey))
                            : GestureDetector(
                                onTap: onTap,
                                child: Image.asset(
                                  imagePath,
                                  scale: 5,
                                ),
                              )
                    : null,
                errorBorder: InputBorder.none,
                counterText: counterText ? null : '',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintStyle: TextStyle(
                  color: ColorTheme().grey50,
                  fontSize: 18.sp,
                  fontFamily: fontFamily,
                ),
                hintText: hintText,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        if (getErrorText().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 8),
            child: textButton2(getErrorText(), color.Error),
          )
      ],
    );
  }
}
