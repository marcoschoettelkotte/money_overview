import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_overview/pages/home/home_page.dart';
import 'package:money_overview/pages/profile/profile_page.dart';

class NavigationBarPages {
  static List<Widget> getPages(BuildContext context) {
    return [
      const HomePage(),
      const ProfilePage(),
    ];
  }
}
