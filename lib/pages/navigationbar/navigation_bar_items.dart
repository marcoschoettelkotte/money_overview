import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationBarItems {
  static List<BottomNavigationBarItem> getItems(BuildContext context) {
    return [
      const BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(FontAwesomeIcons.thLarge),
          ),
          label: ''),
      const BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(FontAwesomeIcons.chartPie),
          ),
          label: ''),
    ];
  }
}
