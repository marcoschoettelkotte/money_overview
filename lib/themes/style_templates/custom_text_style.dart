import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle header1Text = const TextStyle(
      fontFamily: 'Izmir',
      fontSize: 28,
      color: Color(0xFF293d58),
      fontWeight: FontWeight.w900);

  static TextStyle header2Text = const TextStyle(
      fontFamily: 'Izmir',
      fontSize: 18,
      color: Color(0xFF293d58),
      fontWeight: FontWeight.w900);

  static TextStyle header3Text = const TextStyle(
      fontFamily: 'Izmir',
      fontSize: 22,
      color: Color(0xFF43648f),
      fontWeight: FontWeight.w600);

  static Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xFFff9766), Color(0xFFd06af4), Color(0xFF0bb7df)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft
  ).createShader(
    const Rect.fromLTRB(0, 10, 0, 10),
  );

  static TextStyle inputNumberText = TextStyle(
      fontFamily: 'Izmir',
      fontSize: 32,
      decoration: TextDecoration.none,
      foreground: Paint()..shader = linearGradient,
      fontWeight: FontWeight.w600);

  static TextStyle inputText = const TextStyle(
      fontFamily: 'Izmir',
      fontSize: 22,
      decoration: TextDecoration.none,
      color: Color(0xFF43648f),
      fontWeight: FontWeight.w600);

  static TextStyle subHeader1Text = const TextStyle(
      fontFamily: 'Izmir',
      fontWeight: FontWeight.w600,
      color: Color(0xFFa1b1c8),
      fontSize: 18);

  static TextStyle miniButtonText = const TextStyle(
      fontFamily: 'Izmir',
      fontWeight: FontWeight.w600,
      color: Color(0xFFa1b1c8),
      fontSize: 14);

  static TextStyle remainingBalanceText = const TextStyle(
      fontFamily: 'Izmir',
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 17);
  static TextStyle remainingBalanceAmountText = const TextStyle(
      fontFamily: 'Izmir',
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 40);

  static TextStyle moneyTypeTitleText = const TextStyle(
      fontFamily: 'Izmir',
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontSize: 16);
  static TextStyle moneyTypeAmountText = const TextStyle(
      fontFamily: 'Izmir',
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 19);

  static TextStyle moneyCardHeaderText = const TextStyle(
      fontFamily: 'Izmir',
      fontSize: 18,
      color: Color(0xFF293d58),
      fontWeight: FontWeight.w700);
  static TextStyle moneyCardCommentText = const TextStyle(
      fontFamily: 'Izmir',
      fontSize: 15,
      color: Color(0xFF43648f),
      fontWeight: FontWeight.w500);
  static TextStyle moneyCardMoneyText = const TextStyle(
      fontFamily: 'Izmir',
      fontSize: 17,
      color: Color(0xFF293d58),
      fontWeight: FontWeight.w400);
  static TextStyle alertTitleText = const TextStyle(
      fontFamily: 'Izmir',
      fontSize: 21,
      color: Color(0xFF293d58),
      fontWeight: FontWeight.w700);
  static TextStyle alertSubtitleText = const TextStyle(
      fontFamily: 'Izmir',
      fontSize: 17,
      color: Color(0xFF293d58),
      fontWeight: FontWeight.w400);
  static TextStyle itemHeaderTitleText = const TextStyle(
      fontFamily: 'Izmir',
      fontSize: 19,
      color: Color(0xFF293d58),
      fontWeight: FontWeight.w600);
  static TextStyle itemHeaderMoneyText = const TextStyle(
      fontFamily: 'Izmir',
      fontSize: 21,
      color: Color(0xFF293d58),
      fontWeight: FontWeight.w700);

}
