import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:money_overview/models/settings/settings_model.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';
import 'package:money_overview/widgets/view/scaffold_widget.dart';
import 'package:money_overview/widgets/view/scrollview_widget.dart';

import '../../../../themes/style_templates/custom_box_decoration_style.dart';
import 'local_widgets/mode_widget.dart';

class DisplaySettingsPage extends StatefulWidget {
  const DisplaySettingsPage({Key? key}) : super(key: key);

  @override
  _DisplaySettingsPageState createState() => _DisplaySettingsPageState();
}

class _DisplaySettingsPageState extends State<DisplaySettingsPage> {
  SettingsModel model = Hive.box<SettingsModel>('settings').getAt(0)!;

  bool parseBool(Object? obj) {
    if (obj == true) {
      return true;
    }
    return false;
  }

  void updateSystemBar(bool isDark){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Object? val = model.isDarkMode;
    return Container(
      decoration: CustomBoxDecorationStyle.whiteRoundedBoxStyle(context),
      padding: const EdgeInsets.only(top: 24, bottom: 24, right: 8, left: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const ModeWidget(isDark: true),
                  Text("Dark", style: CustomTextStyle.header2Text(context)),
                  Radio(
                    value: true,
                    groupValue: val,
                    fillColor: MaterialStateColor.resolveWith((states) => Theme.of(context).accentColor),
                    onChanged: (value) {
                      setState(() {
                        val = value;
                        model.isDarkMode = parseBool(value);
                        Hive.box<SettingsModel>('settings').put(0, model);
                        updateSystemBar(model.isDarkMode);
                      });
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  const ModeWidget(isDark: false),
                  Text("Light", style: CustomTextStyle.header2Text(context)),
                  Radio(
                    value: false,
                    fillColor: MaterialStateColor.resolveWith((states) => Theme.of(context).accentColor),
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value;
                        model.isDarkMode = parseBool(value);
                        Hive.box<SettingsModel>('settings').put(0, model);
                        updateSystemBar(model.isDarkMode);
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
