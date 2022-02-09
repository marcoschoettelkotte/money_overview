import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_overview/models/finance/finance_model.dart';
import 'package:money_overview/models/money/money_type.dart';
import 'package:money_overview/pages/home/local_widgets/latest_transactions.dart';
import 'package:money_overview/pages/home/local_widgets/overview_card.dart';
import 'package:money_overview/pages/home/local_widgets/welcome_widget.dart';
import 'package:money_overview/widgets/view/scrollview_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var finance = Hive.box<FinanceModel>('finances');
    return ScrollViewWidget(
        child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 40),
      child: Column(
        children: [
          const WelcomeWidget(),
          ValueListenableBuilder<Box<FinanceModel>>(
              valueListenable: Hive.box<FinanceModel>('finances').listenable(),
              builder: (BuildContext context, Box<FinanceModel> box, widget) {
                double income = 0;
                double expenses = 0;
                List<FinanceModel> incomeList =
                    finance.values.where((FinanceModel element) => element.type == MoneyType.incoming).toList();
                List<FinanceModel> expensesList =
                    finance.values.where((FinanceModel element) => element.type == MoneyType.expenses).toList();
                incomeList.every((e) {
                  income += e.money;
                  return true;
                });
                expensesList.every((e) {
                  expenses += e.money;
                  return true;
                });
                return OverviewWidgetCard(
                  income: income,
                  expenses: expenses,
                );
              }),
          const LatestTransactionsWidget(
            isReduced: true,
          )
        ],
      ),
    ));
  }
}
