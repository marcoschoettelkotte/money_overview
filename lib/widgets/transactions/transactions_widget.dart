import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_overview/models/finance/finance_model.dart';
import 'package:money_overview/models/money/money_category.dart';
import 'package:money_overview/models/money/money_cycle.dart';
import 'package:money_overview/models/money/money_payment_type.dart';
import 'package:money_overview/models/money/money_type.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';
import 'package:money_overview/widgets/transactions/delete_finance_dialog_widget.dart';

import '../../models/settings/settings_model.dart';

class TransactionsWidget extends StatefulWidget {
  final bool isReduced;
  final int? loadedTransactions;

  const TransactionsWidget({Key? key, required this.isReduced, this.loadedTransactions}) : super(key: key);

  @override
  _TransactionsWidgetState createState() => _TransactionsWidgetState();
}

class _TransactionsWidgetState extends State<TransactionsWidget> {
  Color amountColor(double amount) {
    if (amount > 450) return const Color(0xFF0bb7df);
    if (amount > 100) return const Color(0xFFd06af4);
    return const Color(0xFFff9766);
  }

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<FinanceModel>>(
      valueListenable: Hive.box<FinanceModel>('finances').listenable(),
      builder: (BuildContext context, Box<FinanceModel> box, widget) {
        Box<SettingsModel> settingsBox = Hive.box("settings");
        bool isCurrentMonth = settingsBox.get(0)!.isCurrentDateMonth;
        DateTime date = DateTime.parse(settingsBox.get(0)!.defaultDateMonth!);
        DateTime currentDate = DateTime.now();
        var list = box.values.map((FinanceModel val) {
          final formatCurrency = NumberFormat.simpleCurrency();
          return GestureDetector(
            onTap: () {
              // hide from statistics
              box.putAt(box.values.toList().indexOf(val), val.updateActive());
            },
            onLongPress: () => CustomDialog.showCustomDialog(
                context,
                "delete ${val.title != '' ? val.title : 'unnamed'}",
                "are you sure you want to delete ${val.title != '' ? val.title : 'unnamed'}?",
                "DELETE",
                val),
            child: Stack(
              children: [
                SizedBox(
                  height: 110,
                  child: Card(
                    shadowColor: const Color(0xFF43648f).withOpacity(0.2),
                    elevation: 2,
                    margin: const EdgeInsets.only(top: 8, bottom: 8),
                    color: Theme.of(context).primaryColor.withOpacity(val.isActive ? 1 : 0.35),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: amountColor(val.money).withOpacity(val.isActive ? 1 : 0.35),
                        child: Icon(
                          val.category.icon(),
                          color: Theme.of(context).primaryColor.withOpacity(val.isActive ? 1 : 0.35),
                          size: 20,
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(val.title != '' ? val.title : 'unnamed',
                            style: CustomTextStyle.moneyCardHeaderText(context), overflow: TextOverflow.ellipsis),
                      ),
                      subtitle: Text(
                        val.comment,
                        style: CustomTextStyle.moneyCardCommentText(context),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      trailing: SizedBox(
                        width: (MediaQuery.of(context).size.width / 3.4) + 40,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                //TODO: edit currency
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3.4,
                                  child: Text(
                                    "\$" +
                                        formatCurrency
                                            .format(val.money)
                                            .replaceAll('\$', '')
                                            .replaceAll('.00', ''),
                                    style: CustomTextStyle.moneyCardMoneyText(context),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5, left: 15, top: 6, bottom: 6),
                                  child: Icon(
                                    val.type.icon(),
                                    color: val.type.color(),
                                    size: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  val.cycle.display(),
                                  style: CustomTextStyle.moneyCardMoneyText(context),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.end,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5, left: 15, top: 6, bottom: 6),
                                  child: Icon(
                                    val.cycle.icon(),
                                    color: Theme.of(context).accentColor,
                                    size: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  val.paymentType.display(),
                                  style: CustomTextStyle.moneyCardMoneyText(context),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.end,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5, left: 15, top: 6, bottom: 6),
                                  child: Icon(
                                    val.paymentType.icon(),
                                    color: Theme.of(context).accentColor,
                                    size: 14,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      textColor: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    width: 10000,
                    height: 110,
                    child: Center(
                      child: AnimatedCrossFade(
                        crossFadeState: val.isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        firstChild: Opacity(
                          opacity: 0,
                          child: Icon(
                            FontAwesomeIcons.pause,
                            color: Theme.of(context).errorColor,
                            size: 32,
                          ),
                        ),
                        secondChild: Icon(
                          FontAwesomeIcons.pause,
                          color: Theme.of(context).errorColor.withOpacity(0.3),
                          size: 32,
                        ), duration: const Duration(milliseconds: 150),
                      )
                    ) 
                ),
                /*
                * AnimatedCrossFade(
                      firstChild: const Center(),
                      crossFadeState: val.isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                      secondChild: Center(
                        child: Icon(
                          FontAwesomeIcons.solidPauseCircle,
                          color: Theme.of(context).errorColor,
                          size: 32,
                        ),
                      ),
                      duration: Duration(milliseconds: val.isActive ? 0 : 400),
                    )*/
              ],
            ),
          );
        }).toList();
        super.widget.isReduced ? list = list.take(super.widget.loadedTransactions!).toList() : null;
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          controller: _controller,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return list.elementAt(index);
          },
        );
      },
    );
  }
}
