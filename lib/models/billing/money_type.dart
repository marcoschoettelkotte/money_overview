import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiver/strings.dart';

enum MoneyType {
  incoming,
  outgoing,
  notSet
}

MoneyType findMoneyTypeByName(String name) {
  try {
    return MoneyType.values.firstWhere((element) => equalsIgnoreCase(element.name, name));
  } catch (err) {
    return MoneyType.notSet;
  }
}

extension MoneyTypeIcon on MoneyType {
  String display(){
    switch(this) {
      case MoneyType.incoming: return 'incoming';
      case MoneyType.outgoing: return 'outgoing';
      case MoneyType.notSet: return 'unknown';
    }
  }
}