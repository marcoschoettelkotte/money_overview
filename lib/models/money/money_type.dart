import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:quiver/strings.dart';
part 'money_type.g.dart';


@HiveType(typeId: 1)
enum MoneyType {
  @HiveField(0)
  incoming,
  @HiveField(1)
  expenses,
  @HiveField(2)
  notSet
}

MoneyType findMoneyTypeByName(String name) {
  try {
    return MoneyType.values
        .firstWhere((element) => equalsIgnoreCase(element.name, name));
  } catch (err) {
    return MoneyType.notSet;
  }
}

extension MoneyTypeDisplay on MoneyType {
  String display() {
    switch (this) {
      case MoneyType.incoming:
        return 'Income';
      case MoneyType.expenses:
        return 'Expenses';
      case MoneyType.notSet:
        return 'unknown';
    }
  }
}

extension MoneyTypeIcon on MoneyType {
  IconData icon() {
    switch (this) {
      case MoneyType.incoming:
        return FontAwesomeIcons.angleDoubleUp;
      case MoneyType.expenses:
        return FontAwesomeIcons.angleDoubleDown;
      case MoneyType.notSet:
        return FontAwesomeIcons.exclamation;
    }
  }
}

extension MoneyTypeColor on MoneyType {
  Color color() {
    switch (this) {
      case MoneyType.incoming:
        return Colors.green.withGreen(255);
      case MoneyType.expenses:
        return Colors.red.withRed(255);
      case MoneyType.notSet:
        return Colors.yellow;
    }
  }
}
