import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:money_overview/models/money/money_type.dart';
import 'package:money_overview/pages/home/local_widgets/overview_card_bottom.dart';
import 'package:money_overview/themes/style_templates/custom_box_decoration_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class OverviewWidgetCard extends StatefulWidget {
  double income;
  double expenses;

  OverviewWidgetCard({Key? key, required this.income, required this.expenses}) : super(key: key);

  @override
  _OverviewWidgetCardState createState() => _OverviewWidgetCardState();
}

class _OverviewWidgetCardState extends State<OverviewWidgetCard> {
  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency();
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
                Text('Remaining Balance', style: CustomTextStyle.remainingBalanceText),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      formatCurrency.format(super.widget.income - super.widget.expenses).replaceFirst('\$', '\$ '),
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
                            money: super.widget.income,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OverviewCardBottomWidget(
                            moneyType: MoneyType.expenses,
                            money: super.widget.expenses,
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
  }
}
