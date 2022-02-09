import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_overview/themes/style_templates/custom_input_decoration_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class InputTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  final bool enabled;
  final String? initValue;

  const InputTextWidget({Key? key, required this.controller, this.placeholder, required this.enabled, this.initValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 14, right: 14, bottom: 6),
      child: SizedBox(
          width: 800.0,
          child: TextFormField(
            initialValue: initValue,
            enabled: enabled,
            style: CustomTextStyle.inputText,
            cursorColor: const Color(0xFF43648f),
            textAlign: TextAlign.start,
            maxLength: 100,
            controller: controller,
            decoration: CustomInputDecorationStyle.input2OutlineStyle(FontAwesomeIcons.book, placeholder),
          )),
    );
  }
}
