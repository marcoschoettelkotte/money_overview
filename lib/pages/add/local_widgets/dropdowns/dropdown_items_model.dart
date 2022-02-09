import 'package:flutter/cupertino.dart';
import 'package:money_overview/models/money/money_category.dart';
import 'package:money_overview/models/money/money_cycle.dart';
import 'package:money_overview/models/money/money_payment_type.dart';
import 'package:money_overview/models/money/money_type.dart';

class DropdownItemsModel extends ChangeNotifier {
  MoneyPaymentType _moneyPaymentType = MoneyPaymentType.values.first;
  MoneyCategory _moneyCategory = MoneyCategory.values.first;
  MoneyCycle _moneyCycle = MoneyCycle.monthly;
  MoneyType _moneyType = MoneyType.values.first;

  MoneyPaymentType get moneyPaymentTypeValue => _moneyPaymentType;

  MoneyCategory get moneyCategoryValue => _moneyCategory;

  MoneyCycle get moneyCycleValue => _moneyCycle;

  MoneyType get moneyTypeValue => _moneyType;

  void editMoneyPaymentType(MoneyPaymentType newValue) {
    _moneyPaymentType = newValue;
    notifyListeners();
  }

  void editMoneyCategory(MoneyCategory newValue) {
    _moneyCategory = newValue;
    notifyListeners();
  }

  void editMoneyCycle(MoneyCycle newValue) {
    _moneyCycle = newValue;
    notifyListeners();
  }

  void editMoneyType(MoneyType newValue) {
    _moneyType = newValue;
    notifyListeners();
  }
}
