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
      counterText: '',
      hintStyle: CustomTextStyle.inputNumberText(context),
      prefixStyle: CustomTextStyle.header3Text(context),
      prefixIcon: TextButton(
        style: CustomButtonStyle.noOverlayButtonStyle,
        onPressed: () {},
        child: Text(
          currencySymbol,
          style: CustomTextStyle.header3Text(context),
        ),
      ),
      fillColor: Theme.of(context).primaryColor,
      prefixIconColor: Theme.of(context).accentColor,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
    );
  }

  static InputDecoration input2OutlineStyle(BuildContext context, IconData icon, String? placeholder) {
    return InputDecoration(
      filled: true,
      hintText: placeholder,
      counterText: '',
      hintStyle: TextStyle(color: Theme.of(context).accentColor),
      prefixIcon: Icon(
        icon,
        color: Theme.of(context).accentColor,
      ),
      fillColor: Theme.of(context).primaryColor,
      prefixIconColor: Theme.of(context).accentColor,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
    );
  }

  static InputDecoration input3OutlineStyle(BuildContext context, IconData icon) {
    return InputDecoration(
      filled: true,
      counterText: '',
      hintStyle: TextStyle(color: Theme.of(context).accentColor),
      prefixIcon: Icon(
        icon,
        color: Theme.of(context).accentColor,
      ),
      fillColor: Theme.of(context).primaryColor,
      prefixIconColor: Theme.of(context).accentColor,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
    );
  }
}
