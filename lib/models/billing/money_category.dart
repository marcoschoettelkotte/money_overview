import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiver/strings.dart';

enum MoneyCategory {
  food,
  entertainment, // cinema
  saving, // crypto, etf
  tax,
  animals,
  salary,
  rent,
  gift,
  medic,
  vacation,
  contracts, // smartphone, computer
  transport, // car, rail
  other,
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

extension BillingCategoryIcon on MoneyCategory {
  IconData icon(){
    switch(this) {
      case MoneyCategory.food: return FontAwesomeIcons.utensils;
      case MoneyCategory.entertainment: return FontAwesomeIcons.futbol;
      case MoneyCategory.saving: return FontAwesomeIcons.piggyBank;
      case MoneyCategory.tax: return FontAwesomeIcons.percentage;
      case MoneyCategory.animals: return FontAwesomeIcons.paw;
      case MoneyCategory.salary: return FontAwesomeIcons.building;
      case MoneyCategory.rent: return FontAwesomeIcons.houseUser;
      case MoneyCategory.gift: return FontAwesomeIcons.gift;
      case MoneyCategory.medic: return FontAwesomeIcons.briefcaseMedical;
      case MoneyCategory.vacation: return FontAwesomeIcons.umbrellaBeach;
      case MoneyCategory.contracts: return FontAwesomeIcons.fileContract;
      case MoneyCategory.transport: return FontAwesomeIcons.bus;
      case MoneyCategory.other: return FontAwesomeIcons.moneyBill;
      case MoneyCategory.notSet: return FontAwesomeIcons.exclamation;

    }
  }
}