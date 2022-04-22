import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_overview/pages/settings/local_widgets/settings_item_widget.dart';
import 'package:money_overview/pages/settings/local_widgets/settings_page_widget.dart';
import 'package:money_overview/pages/settings/settings_underpages/calendar/calendar_settings_page.dart';
import 'package:money_overview/pages/settings/settings_underpages/currency/currency_settings_page.dart';
import 'package:money_overview/pages/settings/settings_underpages/display/display_settings_page.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';
import 'package:money_overview/widgets/appbar_widget.dart';
import 'package:money_overview/widgets/view/scaffold_widget.dart';

class SettingsHomePage extends StatefulWidget {
  const SettingsHomePage({Key? key}) : super(key: key);

  @override
  _SettingsHomePageState createState() => _SettingsHomePageState();
}

class _SettingsHomePageState extends State<SettingsHomePage> {
  @override
  _SettingsHomePageState createState() => _SettingsHomePageState();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return false;
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              const AppBarWidget(),
              SliverList(
                delegate: SliverChildBuilderDelegate((_, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 50, left: 22, right: 22),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 70),
                          child: FittedBox(
                            child: Text('Settings', style: CustomTextStyle.header3BigText(context)),
                          ),
                        ),
                        const SettingsItemWidget(
                          title: 'Marco',
                          avatar: CircleAvatar(
                            backgroundColor: Color(0xFFf7c35a),
                            radius: 25,
                            child: Icon(
                              FontAwesomeIcons.solidUser,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SettingsItemWidget(
                          title: 'Calendar',
                          icon: FontAwesomeIcons.solidCalendar,
                          onTap:() =>
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              const SettingsPageWidget(
                                settingsName: 'Calendar',
                                body: CalendarSettingsPage(),
                              ))),
                        ),
                        SettingsItemWidget(
                          title: 'Currency',
                          onTap: () =>
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              const SettingsPageWidget(
                                settingsName: 'Currency',
                                body: CurrencySettingsPage(),
                              ))),
                          icon: FontAwesomeIcons.coins,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SettingsItemWidget(
                          title: 'Display',
                          onTap: () =>
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              const SettingsPageWidget(
                                settingsName: 'Display',
                                body: DisplaySettingsPage(),
                              ))),
                          icon: FontAwesomeIcons.solidMoon,
                        ),
                        SettingsItemWidget(
                          title: 'Notifications',
                          icon: FontAwesomeIcons.solidBell,
                        ),
                        SettingsItemWidget(
                          title: 'Language',
                          icon: FontAwesomeIcons.solidFlag,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SettingsItemWidget(
                          title: 'Contact',
                          icon: FontAwesomeIcons.at,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Center(
                              child: Text(
                                'Developer: Marco Schöttelkotte\nVersion: 1.0.3',
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.settingsMiniText(context),
                              )),
                        )
                      ],
                    ),
                  );
                }, childCount: 1),
              )
            ],
          ),
        ));
  }
}
