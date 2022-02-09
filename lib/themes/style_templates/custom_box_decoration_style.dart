import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomBoxDecorationStyle {
  static BoxDecoration colorfulGradientCircleBoxStyle = const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        colors: [Color(0xFFff9766), Color(0xFFd06af4), Color(0xFF0bb7df)],
        transform: GradientRotation(0.7853982),
      ));

  static BoxDecoration colorfulGradientRectangleBoxStyle = const BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(32)),
      gradient: LinearGradient(
        colors: [Color(0xFFff9766), Color(0xFFd06af4), Color(0xFF0bb7df)],
        transform: GradientRotation(3.9401),
      ));

  static BoxDecoration colorfulGradient2RectangleBoxStyle = const BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(18)),
      gradient: LinearGradient(
        colors: [Color(0xFFff9766), Color(0xFFd06af4), Color(0xFF0bb7df)],
        transform: GradientRotation(3.9401),
      ));

  static BoxDecoration whiteRoundedBoxStyle = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );

  static BoxDecoration bottomBarBoxStyle = BoxDecoration(
    borderRadius: const BorderRadius.only(topRight: Radius.circular(27), topLeft: Radius.circular(27)),
    boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.01), spreadRadius: 0, blurRadius: 10),
    ],
  );
}
