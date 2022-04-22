import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:money_overview/services/time_service.dart';
import 'package:quiver/strings.dart';
import 'package:quiver/time.dart';

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
  num days(DateTime date) {
    DateTime first = DateTime.utc(date.year, 1, 1);
    DateTime second = DateTime.utc(date.year, 12, daysInMonth(date.year, 12));
    switch (this) {
      case MoneyCycle.daily:
        return 1;
      case MoneyCycle.weekly:
        return 7;
      case MoneyCycle.monthly:
        return daysInMonth(date.year, date.month);
      case MoneyCycle.quarterly:
        switch (date.month) {
          case 11:
            return daysInMonth(date.year, date.month) +
                daysInMonth(date.year, date.month + 1) +
                daysInMonth(date.year, 1);
          case 12:
            return daysInMonth(date.year, date.month) + daysInMonth(date.year, 1) + daysInMonth(date.year, 2);
          default:
            return daysInMonth(date.year, date.month) +
                daysInMonth(date.year, date.month + 1) +
                daysInMonth(date.year, date.month + 2);
        }
      case MoneyCycle.halfYearly:
        return second.difference(first).inDays.toInt() / 2;
      case MoneyCycle.yearly:
        return second.difference(first).inDays.toInt();
      case MoneyCycle.notSet:
        return 0;
    }
  }
}

extension MoneyCycleDivider on MoneyCycle {
  String dateOutput(DateTime date) {
    switch (this) {
      case MoneyCycle.daily:
        return DateFormat("dd.MM.yyyy").format(date);
      case MoneyCycle.weekly:
        return DateFormat("dd.MM.yyyy").format(date) + " - " + DateFormat("dd.MM.yyyy").format(date.add(const Duration(days: 7)));
      case MoneyCycle.monthly:
        return TimeService.calcStartEndTime(date, date.month, date.month);
      case MoneyCycle.quarterly:
        if (date.month >= 1 && date.month <= 3) {
          return TimeService.calcStartEndTime(date, 1, 3);
        } else if (date.month >= 4 && date.month <= 6) {
          return TimeService.calcStartEndTime(date, 4, 6);
        } else if (date.month >= 7 && date.month <= 9) {
          return TimeService.calcStartEndTime(date, 7, 9);
        } else if (date.month >= 10 && date.month <= 12) {
          return TimeService.calcStartEndTime(date, 10, 12);
        } else {
          return "error quartal";
        }
      case MoneyCycle.halfYearly:
        if (date.month < 6) {
          return TimeService.calcStartEndTime(date, 1, 5);
        } else {
          return TimeService.calcStartEndTime(date, 6, 12);
        }
      case MoneyCycle.yearly:
        return TimeService.calcStartEndTime(date, 1, 12);
      case MoneyCycle.notSet:
        return "undefined";
      default:
        return "loo";
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

class MoneyCycleClass {
  MoneyCycle byId(int id) {
    switch (id) {
      case 0:
        return MoneyCycle.daily;
      case 1:
        return MoneyCycle.weekly;
      case 2:
        return MoneyCycle.monthly;
      case 3:
        return MoneyCycle.quarterly;
      case 4:
        return MoneyCycle.halfYearly;
      case 5:
        return MoneyCycle.yearly;
      default:
        return MoneyCycle.notSet;
    }
  }

  int getId(MoneyCycle cycle) {
    switch (cycle) {
      case MoneyCycle.daily:
        return 0;
      case MoneyCycle.weekly:
        return 1;
      case MoneyCycle.monthly:
        return 2;
      case MoneyCycle.quarterly:
        return 3;
      case MoneyCycle.halfYearly:
        return 4;
      case MoneyCycle.yearly:
        return 5;
      default:
        return 6;
    }
  }
}
