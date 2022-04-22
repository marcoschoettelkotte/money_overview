import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_overview/models/money/money_cycle.dart';
import 'package:money_overview/models/settings/settings_model.dart';
import 'package:money_overview/themes/colors.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class CalendarRadioWidget extends StatelessWidget {
  MoneyCycle moneyCycle;
  MoneyCycle groupValue;
  SettingsModel model;
  VoidCallback onPress;

  CalendarRadioWidget(
      {Key? key, required this.moneyCycle, required this.groupValue, required this.model, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: moneyCycle != MoneyCycle.daily ? 5 : 0, bottom: moneyCycle != MoneyCycle.yearly ? 5 : 0),
      decoration: moneyCycle != MoneyCycle.yearly
          ? BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).accentColor.withOpacity(0.25))))
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            moneyCycle.display(),
            style: CustomTextStyle.header2Text(context),
          ),
          Radio(
              value: moneyCycle,
              fillColor: MaterialStateColor.resolveWith((states) => CColors.lightBlue),
              groupValue: groupValue,
              onChanged: (MoneyCycle? value) {
                model.defaultCalendar = value!;
                Hive.box<SettingsModel>('settings').put(0, model);
                onPress();
              }),
        ],
      ),
    );
  }
}
