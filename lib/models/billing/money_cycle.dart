import 'package:quiver/strings.dart';

enum MoneyCycle {
  daily,
  weekly,
  monthly,
  quarterly,
  halfYearly,
  yearly,
  notSet
}

MoneyCycle findMoneyCycleByName(String name) {
  try {
    return MoneyCycle.values
        .firstWhere((el) => equalsIgnoreCase(el.name, name));
  } catch (err) {
    return MoneyCycle.notSet;
  }
}

extension BillingCycleDisplay on MoneyCycle {
  String display(){
    switch(this) {
      case MoneyCycle.daily: return "Daily";
      case MoneyCycle.weekly: return "Weekly";
      case MoneyCycle.monthly: return "Monthly";
      case MoneyCycle.quarterly: return "Quarterly";
      case MoneyCycle.halfYearly: return "Half Yearly";
      case MoneyCycle.yearly: return "Yearly";
      case MoneyCycle.notSet: return "Unknown";
    }
  }
}