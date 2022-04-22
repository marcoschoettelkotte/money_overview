import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_overview/models/settings/settings_model.dart';
import 'package:money_overview/pages/navigation_page.dart';
import 'package:money_overview/services/currency_service.dart';
import 'package:money_overview/themes/dark_theme.dart';
import 'package:money_overview/themes/light_theme.dart';

import 'models/money/money_cycle.dart';

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
    var brightness = SchedulerBinding.instance?.window.platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;

    if (Hive.box<SettingsModel>('settings').values.isEmpty) {
      Hive.box<SettingsModel>('settings').put(
          0,
          SettingsModel(
              username: '',
              imageBase64: '',
              defaultCalendar: MoneyCycle.monthly,
              defaultCurrency: 'Dollar',
              isDarkMode: darkModeOn,
              languageCode: 'en',
              defaultDateMonth: null,
              isCurrentDateMonth: true));
    }

    Future<List<Currency>?>? list = CurrencyService().fetchCurrenciesByCurrency('eur');
    list!.then((List<Currency>? value) => print(value?.elementAt(4).title));

    return ValueListenableBuilder<Box<SettingsModel>>(
        valueListenable: Hive.box<SettingsModel>('settings').listenable(),
        builder: (BuildContext context, Box<SettingsModel> box, widget) {
          return MaterialApp(

              theme: LightTheme.lightTheme,
              darkTheme: DarkTheme.darkTheme,
              themeMode: box.values.first.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              home: const NavigationPage());
        });
  }
}
