import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_overview/models/finance/finance_model.dart';
import 'package:money_overview/models/money/money_cycle.dart';
import 'package:money_overview/models/money/money_type.dart';
import 'package:money_overview/models/settings/settings_model.dart';
import 'package:money_overview/pages/home/local_widgets/overview_card_bottom.dart';
import 'package:money_overview/themes/style_templates/custom_box_decoration_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class OverviewWidgetCard extends StatefulWidget {
  OverviewWidgetCard({Key? key}) : super(key: key);

  @override
  _OverviewWidgetCardState createState() => _OverviewWidgetCardState();
}

class _OverviewWidgetCardState extends State<OverviewWidgetCard> {
  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency();
    return ValueListenableBuilder<Box<SettingsModel>>(
        valueListenable: Hive.box<SettingsModel>('settings').listenable(),
        builder: (BuildContext context, Box<SettingsModel> box, widget) {
          var finance = Hive.box<FinanceModel>('finances');
          double income = 0;
          double expenses = 0;
          List<FinanceModel> incomeList =
              finance.values.where((FinanceModel element) => element.type == MoneyType.incoming).toList();
          List<FinanceModel> expensesList =
              finance.values.where((FinanceModel element) => element.type == MoneyType.expenses).toList();
          incomeList.every((e) {
            income += e.money * box.get(0)!.defaultCalendar.days();
            return true;
          });
          expensesList.every((e) {
            expenses += e.money * box.get(0)!.defaultCalendar.days();
            return true;
          });
          return SizedBox(
              width: 400,
              height: 200,
              child: Container(
                decoration: CustomBoxDecorationStyle.colorfulGradientRectangleBoxStyle,
                child: Padding(
                  padding: const EdgeInsets.only(top: 28, bottom: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Balance/${box.get(0)?.defaultCalendar.display()}',
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
              ));
        });
  }
}
