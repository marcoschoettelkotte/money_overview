import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class CustomDatePickerStyle {
  static DateTimePickerTheme datePickerTheme(BuildContext context) {
    return DateTimePickerTheme(
        backgroundColor: Theme.of(context).primaryColor,
        cancelTextStyle: const TextStyle(color: Colors.red, fontFamily: 'Izmir', fontWeight: FontWeight.w600, fontSize: 18),
        confirmTextStyle: const TextStyle(color: Colors.green, fontFamily: 'Izmir', fontWeight: FontWeight.w600, fontSize: 18),
        itemTextStyle: TextStyle(color: Theme.of(context).accentColor, fontFamily: 'Izmir', fontWeight: FontWeight.w500, fontSize: 22));
  }
}
