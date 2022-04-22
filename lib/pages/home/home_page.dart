import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_overview/models/finance/finance_model.dart';
import 'package:money_overview/models/money/money_cycle.dart';
import 'package:money_overview/models/money/money_type.dart';
import 'package:money_overview/models/settings/settings_model.dart';
import 'package:money_overview/pages/home/local_widgets/latest_transactions.dart';
import 'package:money_overview/pages/home/local_widgets/overview_card.dart';
import 'package:money_overview/pages/home/local_widgets/welcome_widget.dart';
import 'package:money_overview/themes/style_templates/custom_button_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';
import 'package:money_overview/widgets/view/scrollview_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? loadedTransactions = 3;
  late int transactionsLength = Hive.box<FinanceModel>('finances').length;

  @override
  Widget build(BuildContext context) {
    return ScrollViewWidget(
        child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 40),
      child: Column(
        children: [
          const WelcomeWidget(),
          ValueListenableBuilder<Box<FinanceModel>>(
              valueListenable: Hive.box<FinanceModel>('finances').listenable(),
              builder: (BuildContext context, Box<FinanceModel> box, widget) {
                transactionsLength = box.length;
                return Column(
                  children: [
                    // date on top of card
                    ValueListenableBuilder<Box<SettingsModel>>(
                        valueListenable: Hive.box<SettingsModel>('settings').listenable(),
                        builder: (BuildContext context, Box<SettingsModel> settingsBox, settingsWidget) {
                          String date = settingsBox.get(0)!.defaultCalendar.dateOutput(
                              settingsBox.get(0)!.isCurrentDateMonth
                                  ? DateTime.now()
                                  : DateTime.parse(settingsBox.get(0)!.defaultDateMonth!));
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              date,
                              style: CustomTextStyle.header2Text(context),
                            ),
                          );
                        }),
                    OverviewWidgetCard(financeBox: box),
                    LatestTransactionsWidget(
                      isReduced: true,
                      loadedTransactions: loadedTransactions,
                    ),
                    transactionsLength > loadedTransactions!
                        ? TextButton(
                            onPressed: () {
                              setState(() {
                                loadedTransactions = loadedTransactions! + 3;
                              });
                            },
                            style: CustomButtonStyle.miniTextButtonStyle,
                            child: Text(
                              'View More',
                              style: CustomTextStyle.miniButtonText(context),
                            ))
                        : Container(),
                  ],
                );
              }),
        ],
      ),
    ));
  }
}
