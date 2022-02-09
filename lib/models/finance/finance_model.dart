import 'package:hive/hive.dart';
import 'package:money_overview/models/money/money_category.dart';
import 'package:money_overview/models/money/money_cycle.dart';
import 'package:money_overview/models/money/money_payment_type.dart';
import 'package:money_overview/models/money/money_type.dart';
import 'package:uuid/uuid.dart';

part 'finance_model.g.dart';

@HiveType(typeId: 0)
class FinanceModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String comment;
  @HiveField(3)
  final double money;
  @HiveField(4)
  final String currency;
  @HiveField(5)
  final MoneyType type;
  @HiveField(6)
  final MoneyPaymentType paymentType;
  @HiveField(7)
  final MoneyCategory category;
  @HiveField(8)
  final MoneyCycle cycle;

  FinanceModel(
      {required this.id,
      required this.title,
      required this.comment,
      required this.money,
      required this.currency,
      required this.type,
      required this.paymentType,
      required this.category,
      required this.cycle});

  FinanceModel.from({required Map<String, dynamic> json})
      : id = json['id'],
        title = json['title'],
        comment = json['comment'],
        money = json['money'],
        currency = json['currency'],
        type = findMoneyTypeByName(json['type']),
        paymentType = findMoneyPaymentTypeByName(json['paymentType']),
        category = findMoneyCategoryByName(json['category']),
        cycle = findMoneyCycleByName(json['cycle']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'comment': comment,
        'money': money,
        'currency': currency,
        'type': type,
        'category': category,
        'cycle': cycle,
      };
}
