import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:quiver/strings.dart';

part 'money_cycle.g.dart';

@HiveType(typeId: 3)
enum MoneyCycle {
  @HiveField(0)
  daily,
  @HiveField(1)
  weekly,
  @HiveField(2)
  monthly,
  @HiveField(3)
  quarterly,
  @HiveField(4)
  halfYearly,
  @HiveField(5)
  yearly,
  @HiveField(6)
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

extension MoneyCycleIcon on MoneyCycle {
  IconData icon() {
    switch (this) {
      case MoneyCycle.daily:
        return FontAwesomeIcons.calendarDay;
      case MoneyCycle.weekly:
        return FontAwesomeIcons.calendarWeek;
      case MoneyCycle.monthly:
        return FontAwesomeIcons.solidCalendar;
      case MoneyCycle.quarterly:
        return FontAwesomeIcons.solidCalendar;
      case MoneyCycle.halfYearly:
        return FontAwesomeIcons.solidCalendar;
      case MoneyCycle.yearly:
        return FontAwesomeIcons.solidCalendar;
      case MoneyCycle.notSet:
        return FontAwesomeIcons.exclamation;
    }
  }
}

extension BillingCycleDisplay on MoneyCycle {
  String display() {
    switch (this) {
      case MoneyCycle.daily:
        return "Daily";
      case MoneyCycle.weekly:
        return "Weekly";
      case MoneyCycle.monthly:
        return "Monthly";
      case MoneyCycle.quarterly:
        return "Quarterly";
      case MoneyCycle.halfYearly:
        return "Half Yearly";
      case MoneyCycle.yearly:
        return "Yearly";
      case MoneyCycle.notSet:
        return "Unknown";
    }
  }
}
