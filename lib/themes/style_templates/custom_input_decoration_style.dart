import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:money_overview/themes/light_theme.dart';
import 'package:money_overview/themes/style_templates/custom_button_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class CustomInputDecorationStyle {
  static InputDecoration input1OutlineStyle(BuildContext context, String? placeholder) {
    String currencySymbol = '\$';
    return InputDecoration(
      filled: true,
      hintText: placeholder,
      prefixStyle: CustomTextStyle.header3Text,
      prefixIcon: TextButton(
        style: CustomButtonStyle.noOverlayButtonStyle,
        onPressed: () {},
        child: Text(
          currencySymbol,
          style: CustomTextStyle.header3Text,
        ),
      ),
      fillColor: Colors.white,
      prefixIconColor: const Color(0xFF43648f),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
    );
  }

  static InputDecoration input2OutlineStyle(IconData icon, String? placeholder) {
    return InputDecoration(
      filled: true,
      hintText: placeholder,
      counterText: '',
      hintStyle: const TextStyle(color: Color(0xFF43648f)),
      prefixIcon: Icon(
        icon,
        color: const Color(0xFF43648f),
      ),
      fillColor: Colors.white,
      prefixIconColor: const Color(0xFF43648f),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
    );
  }

  static InputDecoration input3OutlineStyle(IconData icon) {
    return InputDecoration(
      filled: true,
      counterText: '',
      hintStyle: const TextStyle(color: Color(0xFF43648f)),
      prefixIcon: Icon(
        icon,
        color: const Color(0xFF43648f),
      ),
      fillColor: Colors.white,
      prefixIconColor: const Color(0xFF43648f),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
    );
  }
}
