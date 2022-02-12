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
    return MoneyCycle.values.firstWhere((el) => equalsIgnoreCase(el.name, name));
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

extension MoneyCycleDays on MoneyCycle {
  int days() {
    switch (this) {
      case MoneyCycle.daily:
        return 1;
      case MoneyCycle.weekly:
        return 7;
      case MoneyCycle.monthly:
        return 30;
      case MoneyCycle.quarterly:
        return 90;
      case MoneyCycle.halfYearly:
        return 180;
      case MoneyCycle.yearly:
        return 360;
      case MoneyCycle.notSet:
        return 0;
    }
  }
}

extension MoneyCycleDivider on MoneyCycle {
  double divider(money) {
    switch (this) {
      case MoneyCycle.daily:
        return money * 30;
      case MoneyCycle.weekly:
        return money * 4;
      case MoneyCycle.monthly:
        return money * 1;
      case MoneyCycle.quarterly:
        return money / 3;
      case MoneyCycle.halfYearly:
        return money / 6;
      case MoneyCycle.yearly:
        return money / 12;
      case MoneyCycle.notSet:
        return 0;
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
