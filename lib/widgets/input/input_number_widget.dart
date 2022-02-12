import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_overview/themes/style_templates/custom_input_decoration_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class InputNumberWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  final bool enabled;
  final String? initValue;

  const InputNumberWidget({Key? key, required this.controller, this.placeholder, required this.enabled, this.initValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 22, right: 22, bottom: 0),
      child: SizedBox(
          width: 400.0,
          child: TextFormField(
            enabled: enabled,
            initialValue: initValue,
            style: CustomTextStyle.inputNumberText(context),
            cursorColor: Theme.of(context).accentColor,
            maxLines: 1,
            keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
            maxLength: 9,
            textAlign: TextAlign.center,
            controller: controller,
            decoration: CustomInputDecorationStyle.input1OutlineStyle(context, placeholder),
            validator: (value) {
              if (value == null || value.trim() == '') {
                return 'please enter a valid number';
              }
              if (double.parse(value) <= 0) {
                return 'the number must be greater than zero';
              }
              return null;
            },
          )),
    );
  }
}
