import 'package:hive/hive.dart';
import 'package:money_overview/models/money/money_cycle.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 10)
class SettingsModel {
  @HiveField(0)
  String username;
  @HiveField(1)
  String imageBase64;
  @HiveField(2)
  MoneyCycle defaultCalendar;
  @HiveField(3)
  String defaultCurrency;
  @HiveField(4)
  bool isDarkMode;
  @HiveField(5)
  String languageCode;
  @HiveField(6)
  String? defaultDateMonth;
  @HiveField(7)
  bool isCurrentDateMonth;

  SettingsModel(
      {required this.username,
      required this.imageBase64,
      required this.defaultCalendar,
      required this.defaultCurrency,
      required this.isDarkMode,
      required this.languageCode,
      required this.defaultDateMonth,
      required this.isCurrentDateMonth});

  SettingsModel.from({required Map<String, dynamic> json})
      : username = json['username'],
        imageBase64 = json['imageBase64'],
        defaultCalendar = json['defaultCalendar'],
        defaultCurrency = json['defaultCurrency'],
        isDarkMode = json['isDarkMode'],
        languageCode = json['languageCode'],
        defaultDateMonth = json['defaultDateMonth'],
        isCurrentDateMonth = json['isCurrentDateMonth'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'imageBase64': imageBase64,
        'defaultCalendar': defaultCalendar,
        'defaultCurrency': defaultCurrency,
        'isDarkMode': isDarkMode,
        'languageCode': languageCode,
        'defaultDateMonth': defaultDateMonth,
        'isCurrentDateMonth': isCurrentDateMonth
      };
}
