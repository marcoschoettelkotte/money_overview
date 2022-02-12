import 'package:flutter/material.dart';
import 'package:money_overview/themes/style_templates/custom_box_decoration_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class SettingsItemWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget? avatar;
  final Function? onTap;

  const SettingsItemWidget({Key? key, required this.title, this.icon, this.avatar, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Theme.of(context).primaryColor,
      child: ListTile(
        onTap: () {
          onTap!();
        },
        contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: icon != null ? CustomTextStyle.settingsTitleText(context) : CustomTextStyle.header1Text(context),
            ),
            avatar ?? Container()
          ],
        ),
        minLeadingWidth: 0,
        leading: Container(
          padding: icon != null ? const EdgeInsets.all(8) : null,
          decoration: icon != null ? CustomBoxDecorationStyle.settingsIconBoxStyle : null,
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: icon != null ? 20 : 0,
          ),
        ),
      ),
    );
  }
}
