import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:quiver/strings.dart';

part 'money_category.g.dart';

@HiveType(typeId: 4)
enum MoneyCategory {
  @HiveField(0)
  food,
  @HiveField(1)
  entertainment, // cinema
  @HiveField(2)
  saving, // crypto, etf
  @HiveField(3)
  tax,
  @HiveField(4)
  animals,
  @HiveField(5)
  salary,
  @HiveField(6)
  rent,
  @HiveField(7)
  gift,
  @HiveField(8)
  medic,
  @HiveField(9)
  vacation,
  @HiveField(10)
  contracts, // smartphone, computer
  @HiveField(11)
  transport, // car, rail
  @HiveField(12)
  other,
  @HiveField(13)
  notSet
}

MoneyCategory findMoneyCategoryByName(String name) {
  try {
    return MoneyCategory.values
        .firstWhere((el) => equalsIgnoreCase(el.name, name));
  } catch (err) {
    return MoneyCategory.notSet;
  }
}

extension MoneyCategoryList on MoneyCategory {
  List<MoneyCategory> list() {
    List<MoneyCategory> list = MoneyCategory.values;
    list.removeLast();
    return list;
  }
}

extension MoneyCategoryDisplay on MoneyCategory {
  String display() {
    switch (this) {
      case MoneyCategory.food:
        return 'Food';
      case MoneyCategory.entertainment:
        return 'Entertainment';
      case MoneyCategory.saving:
        return 'Savings';
      case MoneyCategory.tax:
        return 'Taxes';
      case MoneyCategory.animals:
        return 'Animals';
      case MoneyCategory.salary:
        return 'Salary';
      case MoneyCategory.rent:
        return 'Rent';
      case MoneyCategory.gift:
        return 'Gift';
      case MoneyCategory.medic:
        return 'Medicine';
      case MoneyCategory.vacation:
        return 'Vacation';
      case MoneyCategory.contracts:
        return 'Contracts';
      case MoneyCategory.transport:
        return 'Transport';
      case MoneyCategory.other:
        return 'Other';
      case MoneyCategory.notSet:
        return 'not set';
    }
  }
}

extension MoneyCategoryIcon on MoneyCategory {
  IconData icon() {
    switch (this) {
      case MoneyCategory.food:
        return FontAwesomeIcons.utensils;
      case MoneyCategory.entertainment:
        return FontAwesomeIcons.futbol;
      case MoneyCategory.saving:
        return FontAwesomeIcons.piggyBank;
      case MoneyCategory.tax:
        return FontAwesomeIcons.percentage;
      case MoneyCategory.animals:
        return FontAwesomeIcons.paw;
      case MoneyCategory.salary:
        return FontAwesomeIcons.building;
      case MoneyCategory.rent:
        return FontAwesomeIcons.houseUser;
      case MoneyCategory.gift:
        return FontAwesomeIcons.gift;
      case MoneyCategory.medic:
        return FontAwesomeIcons.briefcaseMedical;
      case MoneyCategory.vacation:
        return FontAwesomeIcons.umbrellaBeach;
      case MoneyCategory.contracts:
        return FontAwesomeIcons.fileContract;
      case MoneyCategory.transport:
        return FontAwesomeIcons.bus;
      case MoneyCategory.other:
        return FontAwesomeIcons.moneyBill;
      case MoneyCategory.notSet:
        return FontAwesomeIcons.exclamation;
    }
  }
}
