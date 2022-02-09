import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class LightTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFFf3f4f6),
    primaryTextTheme: Typography().black,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
  );

  static CurrencyPickerThemeData currencyLightTheme = CurrencyPickerThemeData(
    backgroundColor: const Color(0xFFf3f4f6).withOpacity(0.4),
    subtitleTextStyle: CustomTextStyle.header2Text,
    titleTextStyle: CustomTextStyle.header1Text,
  );
}
