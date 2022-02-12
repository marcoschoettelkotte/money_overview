import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_overview/models/money/money_type.dart';
import 'package:intl/intl.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class OverviewCardBottomWidget extends StatefulWidget {
  final MoneyType moneyType;
  final double money;

  const OverviewCardBottomWidget({Key? key, required this.moneyType, required this.money}) : super(key: key);

  @override
  _OverviewCardBottomWidgetState createState() => _OverviewCardBottomWidgetState();
}

class _OverviewCardBottomWidgetState extends State<OverviewCardBottomWidget> {
  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency();
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.35),
            child: Icon(super.widget.moneyType.icon(), size: 20, color: super.widget.moneyType.color()),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              super.widget.moneyType.name,
              style: CustomTextStyle.moneyTypeTitleText(context),
              overflow: TextOverflow.fade,
            ),
            Text(
              formatCurrency.format(super.widget.money).replaceAll('.00', ''),
              style: CustomTextStyle.moneyTypeAmountText(context),
              overflow: TextOverflow.fade,
            )
          ],
        )
      ],
    );
  }
}
