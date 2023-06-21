import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';

class OtpTextField extends StatefulWidget {
  const OtpTextField({
    required this.text,
    this.onChange
  });

  final String text;
  final Function(String)? onChange;

  @override
  State<StatefulWidget> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {

  final _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  final _focusNode = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  String text = '';

  String getCharacterAt(int index) {
    if (widget.text.length > index) {
      return widget.text[index];
    }
    return '';
  }

  String getText() {
    var text = "";
    _controllers.forEach((controller) {
      text += controller.text;
    });
    return text;
  }

  void onFocus() {
    _focusNode.forEach((focusNode) {
      if (text.length < _focusNode.length) {
        // _focusNode[text.length].requestFocus();
      }
    });
  }

  void handleTextChange(String value) {
    widget.onChange?.call(getText());
    print(getText().length);
    if (value.isNotEmpty) {
      if (getText().length < _focusNode.length) {
        _focusNode[getText().length].requestFocus();
      } else {
        _focusNode[getText().length - 1].requestFocus();
      }
    } else {
      
    }
  }

  @override 
  initState() {
    super.initState();

    _focusNode.forEach((node) {
      node.addListener(onFocus);
    });
  }

  @override 
  void dispose() {
    super.dispose();
    _focusNode.forEach((node) {
      node.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextFieldWidget.enable(
            height: 80,
            text: getCharacterAt(0),
            maxLength: 1,
            textNumberType: true,
            hintText: '',
            textEditingController: _controllers[0],
            focusNode: _focusNode[0],
            onChanged: handleTextChange,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          child: TextFieldWidget.enable(
            height: 80,
            text: getCharacterAt(1),
            maxLength: 1,
            textNumberType: true,
            hintText: '',
            textEditingController: _controllers[1],
            focusNode: _focusNode[1],
            onChanged: handleTextChange,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          child: TextFieldWidget.enable(
            height: 80,
            text: getCharacterAt(2),
            textNumberType: true,
            maxLength: 1,
            hintText: '',
            textEditingController: _controllers[2],
            focusNode: _focusNode[2],
            onChanged: handleTextChange,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          child: TextFieldWidget.enable(
            text: getCharacterAt(3),
            height: 80,
            maxLength: 1,
            textNumberType: true,
            hintText: '',
            textEditingController: _controllers[3],
            focusNode: _focusNode[3],
            onChanged: handleTextChange,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}