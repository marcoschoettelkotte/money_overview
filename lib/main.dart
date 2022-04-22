import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:money_overview/app.dart';
import 'package:money_overview/models/finance/finance_model.dart';
import 'package:money_overview/models/money/money_category.dart';
import 'package:money_overview/models/money/money_cycle.dart';
import 'package:money_overview/models/money/money_payment_type.dart';
import 'package:money_overview/models/money/money_type.dart';
import 'package:money_overview/models/settings/settings_model.dart';
import 'package:money_overview/pages/add/local_widgets/dropdowns/dropdown_items_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // system settings
  ErrorWidget.builder = (FlutterErrorDetails details){
    return const Material();
  };
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter<FinanceModel>(FinanceModelAdapter())..registerAdapter<MoneyType>(
      MoneyTypeAdapter())..registerAdapter<MoneyPaymentType>(MoneyPaymentTypeAdapter())..registerAdapter<MoneyCycle>(
      MoneyCycleAdapter())..registerAdapter<MoneyCategory>(MoneyCategoryAdapter())..registerAdapter<SettingsModel>(
      SettingsModelAdapter());

  await Hive.openBox<FinanceModel>('finances');
  await Hive.openBox<SettingsModel>('settings');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) =>
      runApp(MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => DropdownItemsModel())],
        child: const MoneyOverviewApp(),
      )));
  // run the app
}
