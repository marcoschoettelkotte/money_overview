import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:money_overview/models/money/money_cycle.dart';
import 'package:money_overview/models/settings/settings_model.dart';
import 'package:money_overview/pages/settings/settings_underpages/calendar/local_widgets/calendar_radio_widget.dart';
import 'package:money_overview/themes/colors.dart';
import 'package:money_overview/themes/style_templates/custom_box_decoration_style.dart';
import 'package:money_overview/themes/style_templates/custom_datepicker_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class CalendarSettingsPage extends StatefulWidget {
  const CalendarSettingsPage({Key? key}) : super(key: key);

  @override
  _CalendarSettingsPageState createState() => _CalendarSettingsPageState();
}

class _CalendarSettingsPageState extends State<CalendarSettingsPage> {
  SettingsModel model = Hive.box<SettingsModel>('settings').getAt(0)!;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MoneyCycle valMoneyCycle = model.defaultCalendar;
    bool valIsCurrentDateMonth = model.isCurrentDateMonth;
    return Column(
      children: [
        Container(
          decoration: CustomBoxDecorationStyle.whiteRoundedBoxStyle(context),
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
          child: Column(
            children: MoneyCycle.values
                .map((MoneyCycle moneyCycle) {
                  return CalendarRadioWidget(
                      moneyCycle: moneyCycle, groupValue: valMoneyCycle, model: model, onPress: () => setState(() {}));
                })
                .toList()
                .sublist(0, MoneyCycle.values.length - 1),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
            child: ValueListenableBuilder<Box<SettingsModel>>(
                valueListenable: Hive.box<SettingsModel>('settings').listenable(),
                builder: (BuildContext context, Box<SettingsModel> box, widget) {
                  SettingsModel settings = box.values.first;
                  return Container(
                    decoration: CustomBoxDecorationStyle.whiteRoundedBoxStyle(context),
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(child: Text("use today's date", style: CustomTextStyle.header3Text(context))),
                            Switch.adaptive(
                              value: settings.isCurrentDateMonth,
                              activeColor: CColors.lightBlue,
                              activeTrackColor: CColors.lightBlue.withOpacity(0.45),
                              inactiveThumbColor: CColors.lightBlue,
                              inactiveTrackColor: Colors.black.withOpacity(0.3),
                              onChanged: (value) {
                                setState(() {
                                  settings.isCurrentDateMonth = value;
                                  Hive.box<SettingsModel>('settings').put(0, settings);
                                });
                              },
                            ),
                          ],
                        ),
                        Opacity(
                          opacity: settings.isCurrentDateMonth ? 0.5 : 1,
                          child: GestureDetector(
                            onTap: () {
                              if (!settings.isCurrentDateMonth) {
                                DatePicker.showDatePicker(context,
                                    minDateTime: DateTime.utc(DateTime.now().year - 20, DateTime.now().month, DateTime.now().day),
                                    initialDateTime: settings.defaultDateMonth == null
                                        ? DateTime.now()
                                        : DateTime.tryParse(settings.defaultDateMonth!),
                                    maxDateTime: DateTime.utc(
                                        DateTime.now().year + 20, DateTime.now().month, DateTime.now().day),
                                    pickerTheme: CustomDatePickerStyle.datePickerTheme(context),
                                    onConfirm: (value, list) {
                                      settings.defaultDateMonth = value.toString();
                                      Hive.box<SettingsModel>('settings').put(0, settings);
                                    },
                                    dateFormat: 'MMMM-yyyy');
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 20),
                              child: FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Text(
                                        settings.defaultDateMonth == null
                                            ? DateFormat.MMMM().format(DateTime.now()).toString()
                                            : DateFormat.MMMM()
                                                .format(DateTime.tryParse(settings.defaultDateMonth!)!)
                                                .toString(),
                                        style: CustomTextStyle.datePickerHeaderText(context),
                                      ),
                                    ),
                                    Text(
                                      settings.defaultDateMonth == null
                                          ? DateTime.now().year.toString()
                                          : DateTime.tryParse(settings.defaultDateMonth!)!.year.toString(),
                                      style: CustomTextStyle.datePickerHeaderText(context),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text("EDIT", style: CustomTextStyle.normalButtonText(context),),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }))
      ],
    );
  }
}
