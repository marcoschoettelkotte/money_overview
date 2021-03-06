import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_overview/models/finance/finance_model.dart';
import 'package:money_overview/themes/style_templates/custom_box_decoration_style.dart';
import 'package:money_overview/themes/style_templates/custom_button_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class CustomDialog {

  static Future<void> showCustomDialog(
      BuildContext context, String title, String subtitle, String buttonText, FinanceModel model) async {
    List<Color> colors = [const Color(0xFFff9766), const Color(0xFFd06af4), const Color(0xFF0bb7df)];
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            title.toUpperCase(),
            style: CustomTextStyle.alertTitleText(context),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  subtitle,
                  style: CustomTextStyle.alertSubtitleText(context),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: TextButton(
                    onPressed: () {
                      Hive.box<FinanceModel>('finances').delete(model.id);
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: 1000,
                      height: 50,
                      child: Container(
                        decoration: CustomBoxDecorationStyle.colorfulGradientRectangleBoxStyle(colors),
                        child: Center(
                          child: Text(
                            buttonText,
                            style: CustomTextStyle.remainingBalanceText,
                          ),
                        ),
                      ),
                    ),
                    style: CustomButtonStyle.miniTextButtonStyle,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
