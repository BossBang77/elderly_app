import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/extension/list_extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:hexcolor/hexcolor.dart';

///drop down
///this dropdown work with [TextLabelWidget] only.
///because need to trigger [LabelValidateCubit] when error.
class DropdownWidget extends StatelessWidget {
  ///constructor
  const DropdownWidget(
      {Key? key,
      required this.items,
      required this.onChanged,
      required this.hint,
      this.enable = true,
      this.notMandatory = false,
      this.value,
      this.padding,
      this.validator,
      this.hintStyle =
          const TextStyle(color: Colors.grey, fontFamily: 'Ekachon'),
      this.setErrorWithOuter = false,
      this.errorText = '',
      this.contentPadding})
      : super(key: key);

  ///dropdown title items
  final List<String> items;

  ///on change function
  final ValueChanged<String?>? onChanged;

  ///hint text
  final String hint;

  ///hint text style
  final TextStyle hintStyle;

  ///error text
  final String errorText;

  ///value
  final String? value;

  ///is enable
  final bool enable;

  ///not mandatory
  final bool notMandatory;

  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;

  final FormFieldValidator<String?>? validator;

  ///setErrorWithOuter
  final bool setErrorWithOuter;

  @override
  Widget build(BuildContext context) {
    final List<String> finalList = <String>[
      if (value != null &&
          value?.isNotEmpty == true &&
          items.whereOrNull((String element) => element == value) == null)
        value!,
      ...items
    ];

    return Container(
      padding: (setErrorWithOuter && enable)
          ? EdgeInsets.all(0)
          : padding ?? EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      decoration: (setErrorWithOuter && enable)
          ? null
          : BoxDecoration(
              color: enable
                  ? ColorTheme().GreyBackGround.withOpacity(0.03)
                  : ColorTheme().GreyBackGround,
              border: Border.all(
                  color: enable ? color.GreyBorder : color.GreyBorder,
                  width: 0.8),
              borderRadius: BorderRadius.all(Radius.circular(10))),
      child: DropdownButtonFormField<String>(
          value: value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          decoration: enable
              ? InputDecoration(
                  contentPadding: contentPadding,
                  errorStyle: TextStyle(
                      color: color.Error,
                      fontSize: 16.sp,
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.w500),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: (setErrorWithOuter)
                      ? OutlineInputBorder(
                          gapPadding: 1,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: ColorTheme().Error),
                        )
                      : InputBorder.none,
                  focusedBorder: (setErrorWithOuter)
                      ? OutlineInputBorder(
                          gapPadding: 1,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: ColorTheme().Error),
                        )
                      : InputBorder.none,
                  enabledBorder: (setErrorWithOuter)
                      ? OutlineInputBorder(
                          gapPadding: 1,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: ColorTheme().Error),
                        )
                      : InputBorder.none,
                  focusedErrorBorder: (setErrorWithOuter)
                      ? OutlineInputBorder(
                          gapPadding: 1,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: ColorTheme().Error),
                        )
                      : InputBorder.none,
                  errorBorder: (setErrorWithOuter)
                      ? OutlineInputBorder(
                          gapPadding: 1,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: ColorTheme().Error),
                        )
                      : InputBorder.none,
                  disabledBorder: (setErrorWithOuter)
                      ? OutlineInputBorder(
                          gapPadding: 1,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: ColorTheme().Error),
                        )
                      : InputBorder.none,
                )
              : const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
          isExpanded: true,
          icon: Image.asset(
            'assets/images/arrow_down.png',
            scale: 4,
          ),
          elevation: 16,
          style: TextStyle(
              color: color.black87,
              fontSize: 16.sp,
              fontFamily: fontFamily,
              fontWeight: FontWeight.w500),
          onChanged: enable ? onChanged : null,
          items: finalList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: textSubtitle16W500(
                  value, enable ? Colors.black : ColorTheme().black87),
            );
          }).toList(),
          hint: Text(
            hint,
            style: TextStyle(
                color: color.greyText,
                fontSize: 16.sp,
                fontFamily: fontFamily,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}
