import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_overview/models/finance/finance_model.dart';
import 'package:money_overview/models/money/money_category.dart';
import 'package:money_overview/models/money/money_cycle.dart';
import 'package:money_overview/models/money/money_payment_type.dart';
import 'package:money_overview/models/money/money_type.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';
import 'package:money_overview/widgets/transactions/delete_finance_dialog_widget.dart';

class TransactionsWidget extends StatefulWidget {
  final bool isReduced;

  const TransactionsWidget({Key? key, required this.isReduced}) : super(key: key);

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
        var list = box.values.map((FinanceModel val) {
          final formatCurrency = NumberFormat.simpleCurrency();
          return GestureDetector(
            onLongPress: () => CustomDialog.showCustomDialog(
                context,
                "delete ${val.title != '' ? val.title : 'unnamed'}",
                "are you sure you want to delete ${val.title != '' ? val.title : 'unnamed'}?",
                "DELETE",
                val),
            child: SizedBox(
              height: 110,
              child: Card(
                shadowColor: const Color(0xFF43648f).withOpacity(0.2),
                elevation: 2,
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                color: Theme.of(context).primaryColor,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: amountColor(val.money),
                    child: Icon(
                      val.category.icon(),
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
                  title: Text(val.title != '' ? val.title : 'unnamed',
                      style: CustomTextStyle.moneyCardHeaderText(context), overflow: TextOverflow.ellipsis),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //TODO: edit currency
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.4,
                              child: Text(
                                "\$" + formatCurrency.format(val.money * val.cycle.days()).replaceAll('\$', '').replaceAll('.00', ''),
                                style: CustomTextStyle.moneyCardMoneyText(context),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5, left: 5, top: 3, bottom: 3),
                              child: Icon(
                                val.type.icon(),
                                color: val.type.color(),
                                size: 18,
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
                              padding: const EdgeInsets.only(right: 5, left: 15, top: 3, bottom: 3),
                              child: Icon(
                                val.cycle.icon(),
                                color: Theme.of(context).accentColor,
                                size: 18,
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
                              padding: const EdgeInsets.only(right: 5, left: 15, top: 3, bottom: 3),
                              child: Icon(
                                val.paymentType.icon(),
                                color: Theme.of(context).accentColor,
                                size: 18,
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
          );
        }).toList();
        super.widget.isReduced ? list = list.take(3).toList() : null;
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
