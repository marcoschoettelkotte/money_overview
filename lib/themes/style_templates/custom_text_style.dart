import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle header1Text(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontSize: 24, color: Theme.of(context).accentColor, fontWeight: FontWeight.w900);
  }

  static TextStyle header2Text(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontSize: 14, color: Theme.of(context).accentColor, fontWeight: FontWeight.w900);
  }

  static TextStyle header3Text(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontSize: 19, color: Theme.of(context).buttonColor, fontWeight: FontWeight.w600);
  }

  static TextStyle header3BigText(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontSize: 30, color: Theme.of(context).buttonColor, fontWeight: FontWeight.w700);
  }

  static TextStyle settingsTitleText(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontSize: 20, color: Theme.of(context).buttonColor, fontWeight: FontWeight.w500);
  }

  static TextStyle settingsMiniText(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontSize: 13, color: Theme.of(context).buttonColor, fontWeight: FontWeight.w300);
  }

  static Shader linearGradient = const LinearGradient(
          colors: <Color>[Color(0xFFff9766), Color(0xFFd06af4), Color(0xFF0bb7df)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft)
      .createShader(
    const Rect.fromLTRB(0, 10, 0, 10),
  );

  static TextStyle inputNumberText(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir',
        fontSize: 25,
        decoration: TextDecoration.none,
        color: Theme.of(context).accentColor,
        fontWeight: FontWeight.w600);
  }

  static TextStyle inputText(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir',
        fontSize: 17,
        decoration: TextDecoration.none,
        color: Theme.of(context).accentColor,
        fontWeight: FontWeight.w600);
  }

  static TextStyle subHeader1Text(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontWeight: FontWeight.w600, color: Theme.of(context).cardColor, fontSize: 14);
  }

  static TextStyle miniButtonText(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontWeight: FontWeight.w600, color: Theme.of(context).cardColor, fontSize: 14);
  }
  static TextStyle normalButtonText(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontWeight: FontWeight.w600, color: Theme.of(context).cardColor, fontSize: 19);
  }

  static TextStyle remainingBalanceText =
      const TextStyle(fontFamily: 'Izmir', fontWeight: FontWeight.w600, color: Colors.white, fontSize: 15);
  static TextStyle remainingBalanceAmountText =
      const TextStyle(fontFamily: 'Izmir', fontWeight: FontWeight.w700, color: Colors.white, fontSize: 34);

  static TextStyle moneyTypeTitleText(BuildContext context) {
    return const TextStyle(fontFamily: 'Izmir', fontWeight: FontWeight.w400, color: Colors.white, fontSize: 13);
  }

  static TextStyle moneyTypeAmountText(BuildContext context) {
    return const TextStyle(fontFamily: 'Izmir', fontWeight: FontWeight.w600, color: Colors.white, fontSize: 17);
  }

  static TextStyle moneyCardHeaderText(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontSize: 14, color: Theme.of(context).accentColor, fontWeight: FontWeight.w700);
  }

  static TextStyle moneyCardCommentText(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontSize: 12, color: Theme.of(context).buttonColor, fontWeight: FontWeight.w500);
  }

  static TextStyle moneyCardMoneyText(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontSize: 14, color: Theme.of(context).accentColor, fontWeight: FontWeight.w400);
  }

  static TextStyle alertTitleText(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontSize: 17, color: Theme.of(context).accentColor, fontWeight: FontWeight.w700);
  }

  static TextStyle alertSubtitleText(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontSize: 14, color: Theme.of(context).accentColor, fontWeight: FontWeight.w400);
  }

  static TextStyle itemHeaderTitleText(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontSize: 15, color: Theme.of(context).accentColor, fontWeight: FontWeight.w600);
  }

  static TextStyle itemHeaderMoneyText(BuildContext context) {
    return TextStyle(
        fontFamily: 'Izmir', fontSize: 17, color: Theme.of(context).accentColor, fontWeight: FontWeight.w700);
  }
  static TextStyle datePickerHeaderText(BuildContext context){
    return TextStyle(
        color: Theme.of(context).accentColor, fontFamily: 'Izmir', fontWeight: FontWeight.w500, fontSize: 28);
  }
}
