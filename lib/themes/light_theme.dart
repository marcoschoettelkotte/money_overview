import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class LightTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor:  Colors.white,
    primaryTextTheme: Typography().black,
    backgroundColor: const Color(0xFFf3f4f6),
    accentColor: const Color(0xFF293d58),
    buttonColor: const Color(0xFF43648f),
    dividerColor: const Color(0xFF43648f),
    cardColor: const Color(0xFFa1b1c8),
    appBarTheme: const AppBarTheme(
      brightness: Brightness.light,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
  );

  static CurrencyPickerThemeData currencyLightTheme(BuildContext context){
    return CurrencyPickerThemeData(
      backgroundColor: const Color(0xFFf3f4f6).withOpacity(0.4),
      subtitleTextStyle: CustomTextStyle.header2Text(context),
      titleTextStyle: CustomTextStyle.header1Text(context),
    );
  }
}
