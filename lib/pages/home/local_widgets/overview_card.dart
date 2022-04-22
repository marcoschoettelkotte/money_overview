import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_overview/models/finance/finance_model.dart';
import 'package:money_overview/models/money/money_cycle.dart';
import 'package:money_overview/models/money/money_type.dart';
import 'package:money_overview/models/settings/settings_model.dart';
import 'package:money_overview/pages/home/local_widgets/overview_card_bottom.dart';
import 'package:money_overview/pages/settings/local_widgets/settings_page_widget.dart';
import 'package:money_overview/themes/style_templates/custom_box_decoration_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

import '../../settings/settings_underpages/calendar/calendar_settings_page.dart';

class OverviewWidgetCard extends StatefulWidget {
  final Box<FinanceModel> financeBox;

  const OverviewWidgetCard({Key? key, required this.financeBox}) : super(key: key);

  @override
  _OverviewWidgetCardState createState() => _OverviewWidgetCardState();
}

class _OverviewWidgetCardState extends State<OverviewWidgetCard> {
  MoneyCycleClass moneyCycleClass = MoneyCycleClass();
  SettingsModel? settingsModel;
  List<Color> colors = [const Color(0xFFff9766), const Color(0xFFd06af4), const Color(0xFF0bb7df)];
  double boxOpacity = 0.2;

  void _updateNextDefaultCalendar(Box<SettingsModel> box) {
    for (int i = 0; i < MoneyCycle.values.length; i++) {
      if (box.getAt(0)?.defaultCalendar == moneyCycleClass.byId(i)) {
        settingsModel = box.getAt(0);
        if (moneyCycleClass.byId(i + 1) == MoneyCycle.notSet) {
          settingsModel?.defaultCalendar = moneyCycleClass.byId(0);
        } else {
          settingsModel?.defaultCalendar = moneyCycleClass.byId(i + 1);
        }
        Hive.box<SettingsModel>('settings').put(0, settingsModel!);
        break;
      }
    }
  }

  void _changeBackgroundColor() {
    setState(() {
      List<Color> newColors = [colors[2].withOpacity(0.9), colors[0].withOpacity(0.9), colors[1].withOpacity(0.9)];
      colors = newColors;
      boxOpacity = 0.7;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency();

    return ValueListenableBuilder<Box<SettingsModel>>(
        valueListenable: Hive.box<SettingsModel>('settings').listenable(),
        builder: (BuildContext context, Box<SettingsModel> settingsBox, settingsWidget) {
          double income = 0;
          double expenses = 0;
          List<FinanceModel> incomeList = super
              .widget
              .financeBox
              .values
              .where((FinanceModel element) => element.type == MoneyType.incoming && element.isActive)
              .toList();
          List<FinanceModel> expensesList = super
              .widget
              .financeBox
              .values
              .where((FinanceModel element) => element.type == MoneyType.expenses && element.isActive)
              .toList();
          bool isCurrentMonth = settingsBox.get(0)!.isCurrentDateMonth;
          DateTime date = DateTime.parse(settingsBox.get(0)!.defaultDateMonth!);
          DateTime currentDate = DateTime.now();
          //TODO: richtige berrechnung
          incomeList.every((e) {
            // income += e.money * settingsBox.get(0)!.defaultCalendar.days(isCurrentMonth ? currentDate : date);
            return true;
          });
          expensesList.every((e) {
            // expenses += e.money * settingsBox.get(0)!.defaultCalendar.days(isCurrentMonth ? currentDate : date);
            return true;
          });
          return SizedBox(
              width: 400,
              height: 200,
              child: InkWell(
                splashColor: Colors.red,
                focusColor: Colors.blue,
                borderRadius: const BorderRadius.all(Radius.circular(32)),
                onLongPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const SettingsPageWidget(
                    settingsName: 'Calendar',
                    body: CalendarSettingsPage(),
                  )));
                },
                onTap: () {
                  _updateNextDefaultCalendar(settingsBox);
                  _changeBackgroundColor();
                  Future.delayed(const Duration(milliseconds: 200), () => setState(() => boxOpacity = 0.2));
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(32)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(boxOpacity),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    decoration: CustomBoxDecorationStyle.colorfulGradientRectangleBoxStyle(colors),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 28, bottom: 14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Balance/${settingsBox.get(0)?.defaultCalendar.display()}',
                              style: CustomTextStyle.remainingBalanceText),
                          FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                formatCurrency.format(income - expenses).replaceFirst('\$', '\$').replaceAll('.00', ''),
                                style: CustomTextStyle.remainingBalanceAmountText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: FittedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: OverviewCardBottomWidget(
                                      moneyType: MoneyType.incoming,
                                      money: income,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: OverviewCardBottomWidget(
                                      moneyType: MoneyType.expenses,
                                      money: expenses,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}
