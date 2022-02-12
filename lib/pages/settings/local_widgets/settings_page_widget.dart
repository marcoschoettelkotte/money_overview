import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';
import 'package:money_overview/widgets/view/scaffold_widget.dart';
import 'package:money_overview/widgets/view/scrollview_widget.dart';

class SettingsPageWidget extends StatefulWidget {
  final String settingsName;
  final Widget body;
  const SettingsPageWidget({Key? key, required this.settingsName, required this.body}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(FontAwesomeIcons.angleLeft),
            color: Theme.of(context).accentColor,
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        title: Text(
          super.widget.settingsName,
          style: CustomTextStyle.header2Text(context),
        ),
      ),
      body: ScrollViewWidget(
        child: Padding(
          padding:  const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: super.widget.body,
        ),
      ),
    );
  }
}
