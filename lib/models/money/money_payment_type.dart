import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:quiver/strings.dart';

part 'money_payment_type.g.dart';

@HiveType(typeId: 2)
enum MoneyPaymentType {
  @HiveField(0)
  creditCard,
  @HiveField(1)
  debitCard,
  @HiveField(2)
  paypal,
  @HiveField(3)
  skrill,
  @HiveField(4)
  giftcard,
  @HiveField(5)
  googlePay,
  @HiveField(6)
  giroPay,
  @HiveField(7)
  cash,
  @HiveField(8)
  other,
  @HiveField(9)
  notSet,
}

MoneyPaymentType findMoneyPaymentTypeByName(String name) {
  try {
    return MoneyPaymentType.values
        .firstWhere((element) => equalsIgnoreCase(element.name, name));
  } catch (err) {
    return MoneyPaymentType.notSet;
  }
}

extension MoneyPaymentTypeDisplay on MoneyPaymentType {
  String display() {
    switch (this) {
      case MoneyPaymentType.creditCard:
        return "Credit Card";
      case MoneyPaymentType.debitCard:
        return "Debit Card";
      case MoneyPaymentType.paypal:
        return "PayPal";
      case MoneyPaymentType.skrill:
        return "Skrill";
      case MoneyPaymentType.giftcard:
        return "GiftCard";
      case MoneyPaymentType.googlePay:
        return "GooglePay";
      case MoneyPaymentType.giroPay:
        return "GiroPay";
      case MoneyPaymentType.cash:
        return "Cash";
      case MoneyPaymentType.other:
        return "Other";
      case MoneyPaymentType.notSet:
        return "Unknown";
    }
  }
}

extension MoneyPaymentTypeIcon on MoneyPaymentType {
  IconData icon() {
    switch (this) {
      case MoneyPaymentType.creditCard:
        return FontAwesomeIcons.solidCreditCard;
      case MoneyPaymentType.debitCard:
        return FontAwesomeIcons.solidCreditCard;
      case MoneyPaymentType.paypal:
        return FontAwesomeIcons.paypal;
      case MoneyPaymentType.skrill:
        return FontAwesomeIcons.solidCreditCard;
      case MoneyPaymentType.giftcard:
        return FontAwesomeIcons.solidCreditCard;
      case MoneyPaymentType.googlePay:
        return FontAwesomeIcons.googlePay;
      case MoneyPaymentType.giroPay:
        return FontAwesomeIcons.solidCreditCard;
      case MoneyPaymentType.cash:
        return FontAwesomeIcons.moneyBillWave;
      case MoneyPaymentType.other:
        return FontAwesomeIcons.solidCreditCard;
      case MoneyPaymentType.notSet:
        return FontAwesomeIcons.exclamation;
    }
  }
}
