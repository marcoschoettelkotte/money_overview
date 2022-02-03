import 'package:quiver/strings.dart';

enum MoneyPaymentType {
  creditCard,
  debitCard,
  paypal,
  skrill,
  giftcard,
  googlePay,
  giroPay,
  notSet,
}

MoneyPaymentType findMoneyPaymentTypeByName(String name) {
  try {
    return MoneyPaymentType.values.firstWhere((element) => equalsIgnoreCase(element.name, name));
  } catch (err) {
    return MoneyPaymentType.notSet;
  }
}

extension BillingTypeDisplay on MoneyPaymentType {
  String display() {
    switch(this) {
      case MoneyPaymentType.creditCard: return "Credit Card";
      case MoneyPaymentType.debitCard: return "Debit Card";
      case MoneyPaymentType.paypal: return "PayPal";
      case MoneyPaymentType.skrill: return "Skrill";
      case MoneyPaymentType.giftcard: return "GiftCard";
      case MoneyPaymentType.googlePay: return "GooglePay";
      case MoneyPaymentType.giroPay: return "GiroPay";
      case MoneyPaymentType.notSet: return "Unknown";
    }
  }
}