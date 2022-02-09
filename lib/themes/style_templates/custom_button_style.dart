import 'package:flutter/material.dart';

class CustomButtonStyle {
  static ButtonStyle miniTextButtonStyle =
      ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.05)));

  static ButtonStyle noOverlayButtonStyle = ButtonStyle(
      elevation: MaterialStateProperty.all(100),
      overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.1)));

  static ButtonStyle noOverlayButton2Style = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(
            color: Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
      overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.1)));
}
