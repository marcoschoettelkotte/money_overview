import 'package:flutter/material.dart';
import 'package:money_overview/pages/list/list_page.dart';
import 'package:money_overview/themes/style_templates/custom_button_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';
import 'package:money_overview/widgets/transactions/transactions_widget.dart';

class LatestTransactionsWidget extends StatefulWidget {
  final bool isReduced;

  const LatestTransactionsWidget({Key? key, required this.isReduced}) : super(key: key);

  @override
  _LatestTransactionsWidgetState createState() => _LatestTransactionsWidgetState();
}

class _LatestTransactionsWidgetState extends State<LatestTransactionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Transactions',
                style: CustomTextStyle.header2Text(context),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ListPage()));
                  },
                  style: CustomButtonStyle.miniTextButtonStyle,
                  child: Text(
                    'View All',
                    style: CustomTextStyle.miniButtonText(context),
                  ))
            ],
          ),
          TransactionsWidget(isReduced: super.widget.isReduced)
        ]));
  }
}
