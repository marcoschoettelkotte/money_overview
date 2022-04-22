import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff2E2E48),
    primaryTextTheme: Typography().white,
    backgroundColor: const Color(0xff27273D),
    accentColor: const Color(0xffd6d6f7),
    buttonColor: const Color(0xffc3c3e8),
    cardColor: const Color(0xffA8A8C7),
    indicatorColor: const Color(0xFF0bb7df),
    appBarTheme: const AppBarTheme(
      brightness: Brightness.dark,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
  );
}
