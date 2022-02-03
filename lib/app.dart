import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_overview/pages/home/home_page.dart';
import 'package:money_overview/themes/light_theme.dart';

class MoneyOverviewApp extends StatelessWidget {
  const MoneyOverviewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
