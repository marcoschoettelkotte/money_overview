import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_overview/models/money/money_cycle.dart';
import 'package:money_overview/models/settings/settings_model.dart';
import 'package:money_overview/pages/settings/settings_underpages/calendar/local_widgets/calendar_radio_widget.dart';
import 'package:money_overview/themes/style_templates/custom_box_decoration_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class CalendarSettingsPage extends StatefulWidget {
  const CalendarSettingsPage({Key? key}) : super(key: key);

  @override
  _CalendarSettingsPageState createState() => _CalendarSettingsPageState();
}

class _CalendarSettingsPageState extends State<CalendarSettingsPage> {
  SettingsModel model = Hive.box<SettingsModel>('settings').getAt(0)!;

  @override
  Widget build(BuildContext context) {
    MoneyCycle val = model.defaultCalendar;
    return Container(
      decoration: CustomBoxDecorationStyle.whiteRoundedBoxStyle(context),
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
      child: Column(
        children: MoneyCycle.values
            .map((MoneyCycle moneyCycle) {
              return CalendarRadioWidget(
                  moneyCycle: moneyCycle, groupValue: val, model: model, onPress: () => setState(() {}));
            })
            .toList()
            .sublist(0, MoneyCycle.values.length - 1),
      ),
    );
  }
}
