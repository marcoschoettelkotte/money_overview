import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_overview/pages/navigation_page.dart';
import 'package:money_overview/themes/dark_theme.dart';
import 'package:money_overview/themes/light_theme.dart';

class MoneyOverviewApp extends StatefulWidget {
  const MoneyOverviewApp({Key? key}) : super(key: key);

  @override
  _MoneyOverviewAppState createState() => _MoneyOverviewAppState();
}

class _MoneyOverviewAppState extends State<MoneyOverviewApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: LightTheme.lightTheme,
        darkTheme: DarkTheme.darkTheme,
        themeMode: ThemeMode.light,
        home: const NavigationPage());
  }
}
