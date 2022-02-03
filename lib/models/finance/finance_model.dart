import 'package:money_overview/models/billing/money_category.dart';
import 'package:money_overview/models/billing/money_cycle.dart';
import 'package:money_overview/models/billing/money_payment_type.dart';
import 'package:money_overview/models/billing/money_type.dart';

class FinanceModel {
  String title;
  String comment;
  double money;
  String currency;
  MoneyType type;
  MoneyPaymentType paymentType;
  MoneyCategory category;
  MoneyCycle moneyCycle;

  FinanceModel({
    required this.title,
    required this.comment,
    required this.money,
    required this.currency,
    required this.type,
    required this.paymentType,
    required this.category,
    required this.moneyCycle
  });

  FinanceModel.from({required Map<String, dynamic> json})
      : title = json['title'],
        comment = json['comment'],
        money = json['money'],
        currency = json['currency'],
        type = findMoneyTypeByName(json['type']),
        paymentType = findMoneyPaymentTypeByName(json['paymentType']),
        category = findMoneyCategoryByName(json['category']),
        moneyCycle = findMoneyCycleByName(json['moneyCycle']);

  Map<String, dynamic> toJson() => {
    'title': title,
    'comment': comment,
    'money': money,
    'currency': currency,
    'type': type.name,
    'category': category.name,
    'moneyCycle': moneyCycle.name,
  };
}
